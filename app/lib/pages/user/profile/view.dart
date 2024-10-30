import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:nil/nil.dart';
import '../../../build_gen/assets.gen.dart';
import '../../../widgets/boss_scroll_column_expandable.dart';
import '../../layout/widgets/drawer/index.dart';
import 'data.dart';
import 'index.dart';
import 'widgets/clipper.dart';
import 'widgets/header.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfilePage extends GetView<UserProfileController> {
  const UserProfilePage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("UserProfilePage"),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("user_profile"),
      leading: GFIconButton(
        size: GFSize.SMALL,
        color: Colors.transparent,
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
    );
  }

  Widget _buidlFooter() {
    return SliverFillRemaining(
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
    );
  }

  SliverToBoxAdapter _buildListView() {
    return SliverToBoxAdapter(
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
          appBar: _buildAppBar(),

          body: Column(
            children: [
              Align(
                heightFactor: 0,
                alignment: Alignment(0, -0.5.r),
                child: Image.network(
                  'https://idsb.tmgrup.com.tr/ly/uploads/images/2020/05/13/35552.jpeg',
                  width: 480.r,
                ),
              ),
              Container(
                height: 200,
                color: Colors.black,
              ),

              // _buildListView(),
              // _buidlFooter(),
            ],
          ),
        );
      },
    );
  }
}
