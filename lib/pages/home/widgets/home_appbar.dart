import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../build_gen/assets.gen.dart';
import '../controller.dart';

class HomeAppbar extends SliverAppBar {
  HomeAppbar({
    super.key,
    required List<HomeTab> tabs,
  }) : super(
          leadingWidth: 50.r,
          leading: GFAvatar(
            backgroundImage: Assets.images.loginMoodBoard.image().image,
          ),
          title: SizedBox(
            height: 64.r,
            child: GFTextFieldPill(
              editingbordercolor: Colors.red,
              idlebordercolor: Colors.black,
              borderwidth: 1,
              hintText: "ai写代码",
              scrollPadding: EdgeInsets.all(0),
              paddingvertical: 0,
              style: TextStyle(
                height: 1,
              ),
            ),
          ),
          actions: [
            GFIconButton(
              size: GFSize.SMALL,
              icon: SizedBox(
                width: 90.r,
                height: 90.r,
                child: ClipOval(
                  child: Assets.images.loginMoodBoard.image(
                    fit: BoxFit.cover,
                    width: 30.r,
                  ),
                ),
              ),
              type: GFButtonType.transparent,
              onPressed: () {},
            ),
            GFIconButton(
              size: GFSize.SMALL,
              icon: Icon(Icons.notifications),
              type: GFButtonType.transparent,
              onPressed: () {},
            ),
            GFIconButton(
              size: GFSize.SMALL,
              icon: Badge(
                label: Text('3'),
                backgroundColor: Colors.red,
                child: Icon(Icons.email),
              ),
              type: GFButtonType.transparent,
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            labelStyle: TextStyle(fontSize: 14.r),
            tabs: tabs.map((tab) => Tab(text: tab.title)).toList(),
          ),
        );
}
