import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/boss_text.dart';
import 'index.dart';

class SearchingPage extends GetView<SearchingController> {
  const SearchingPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("SearchingPage1111"),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.keyboard_arrow_left),
      ),
      title: SizedBox(
        height: 80.r,
        child: TextField(
          cursorHeight: 32.r,
          cursorWidth: 3.r,
          decoration: InputDecoration(
            // suffix: Icon(
            //   Icons.search,
            //   size: 44.r,
            // ),
            suffixIcon: Icon(
              Icons.search,
              size: 44.r,
            ),
            prefixIcon: Icon(
              Icons.search,
              size: 44.r,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 32.r),
            hintStyle: TextStyle(fontSize: 28.r),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(200.r),
              // borderSide: BorderSide(width: 1.r),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(200.r),
              borderSide: BorderSide(width: 1.r),
            ),
            hintText: "搜索",
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () {}, child: Text("搜索")),
      ],
      // leadingWidth: 48.r,
      titleSpacing: 0,
    );
  }

  ExpansionPanelList _buildHistory() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {},
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Column(
              children: [
                ListTile(
                  title: Text("item.headerValue"),
                ),
                Wrap(
                  children: [
                    BossText.ellipsis(
                      text: "item.expandedValue",
                      bgcolor: Colors.black,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      padding: EdgeInsets.symmetric(horizontal: 20.r),
                      maxWidth: 200.r,
                      before: Icon(Icons.abc),
                    ),
                  ],
                )
              ],
            );
          },
          body: ListTile(
            title: Text("item.expandedValue"),
            subtitle: const Text('To delete this panel, tap the trash can icon'),
            trailing: const Icon(Icons.delete),
            onTap: () {},
          ),
          isExpanded: true,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchingController>(
      init: SearchingController(),
      id: "searching",
      builder: (_) {
        return Scaffold(
          appBar: _buildAppbar(),
          body: SafeArea(
            child: Column(
              children: [
                _buildHistory(),
              ],
            ),
          ),
        );
      },
    );
  }
}
