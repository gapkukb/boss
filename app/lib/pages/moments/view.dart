import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/boss_icon.dart';
import 'index.dart';

class MomentsPage extends GetView<MomentsController> {
  const MomentsPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("MomentsPage"),
    );
  }

  Widget _buidCard() {
    return GFCard(
      titlePosition: GFPosition.start,
      image: Image.network(
        "https://picsum.photos/250?image=9",
        height: 200.r,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      title: GFListTile(
        padding: EdgeInsets.symmetric(vertical: 8.0.r),
        margin: EdgeInsets.zero,
        avatar: GFAvatar(
          backgroundImage: NetworkImage("https://picsum.photos/250?image=9"),
          size: 64.w,
        ),
        titleText: "远古时代装机员",
        subTitleText: "直播了",
        icon: BossIcon(
          Icons.more_vert,
          onTap: () {},
        ),
      ),
      showImage: true,
      content: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "内容",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 10.sp),
        ),
      ),
      buttonBar: GFButtonBar(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.start,
        runAlignment: WrapAlignment.start,
        children: [
          GFButton(
            size: GFSize.SMALL,
            onPressed: () {},
            text: "关注",
          ),
          GFButton(
            size: GFSize.SMALL,
            onPressed: () {},
            text: "评论",
          ),
          GFButton(
            size: GFSize.SMALL,
            onPressed: () {},
            text: "点赞",
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MomentsController>(
      init: MomentsController(),
      id: "moments",
      builder: (_) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "动态",
                style: TextStyle(fontSize: 28.sp),
              ),
              centerTitle: true,
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: "全部",
                  ),
                  Tab(
                    text: "视频",
                  ),
                ],
              ),
              actions: [
                GFIconButton(
                  type: GFButtonType.transparent,
                  icon: Iconify(
                    MaterialSymbols.edit_square_outline,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate.fixed([
                      _buidCard(),
                      _buidCard(),
                      _buidCard(),
                      _buidCard(),
                      _buidCard(),
                      _buidCard(),
                      _buidCard(),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
