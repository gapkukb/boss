import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import '../../../build_gen/assets.gen.dart';
import '../../../widgets/scroll_column_expandable.dart';
import '../../layout/widgets/drawer/index.dart';
import 'data.dart';
import 'index.dart';
import 'widgets/clipper.dart';
import 'widgets/header.dart';
import 'package:iconify_flutter/icons/ic.dart';

class UserProfilePage extends GetView<UserProfileController> {
  const UserProfilePage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("UserProfilePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(
      init: UserProfileController(),
      id: "user_profile",
      builder: (_) {
        return Scaffold(
          // backgroundColor: Colors.grey,
          appBar: AppBar(
            title: const Text("user_profile"),
            leading: GFIconButton(
              size: GFSize.SMALL,
              color: Colors.transparent,
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),

          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                // floating: true,
                delegate: Header(),
              ),
              SliverToBoxAdapter(
                child: Container(
                  width: 64,
                  height: 64,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: Assets.images.loginMoodBoard.image().image,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: ListView.separated(
                  itemCount: groups.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const Divider(
                    indent: 60,
                  ),
                  itemBuilder: (context, index) {
                    return groups[index];
                  },
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {},
                      child: Text(
                        "登出",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
