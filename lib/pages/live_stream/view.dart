import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/boss_icon.dart';
import 'index.dart';

import 'package:getwidget/getwidget.dart';

final List<String> imageList = [
  "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
  "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
  "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
];

class LiveStreamPage extends GetView<LiveStreamController> {
  const LiveStreamPage({super.key});

  // 主视图
  Widget _buildView() {
    return GFCarousel(
      hasPagination: true,
      items: imageList.map(
        (url) {
          return Container(
            margin: EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(url, fit: BoxFit.cover, width: 1000.0),
            ),
          );
        },
      ).toList(),
      onPageChanged: (index) {},
    );
  }

  Widget _buildCard() {
    return GFCard(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,

      image: Image.network(
        'https://picsum.photos/200/300',
        height: 100.r,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      showImage: true,
      // title: ListTile(
      //   title: Text('Card Title'),
      //   leading: GFAvatar(
      //     backgroundImage: NetworkImage('https://picsum.photos/64/64'),
      //     size: GFSize.SMALL,
      //   ),
      // ),
      content: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('Card Title', maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text('Card subTitle', maxLines: 1, overflow: TextOverflow.ellipsis),
        horizontalTitleGap: 8.r,
        leading: GFAvatar(
          backgroundImage: NetworkImage('https://picsum.photos/64/64'),
          size: GFSize.SMALL,
        ),
        trailing: BossIcon(
          Icons.more_vert,
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.extent(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: 1,
      maxCrossAxisExtent: 250,
      mainAxisSpacing: 8.r,
      crossAxisSpacing: 8.r,
      children: [
        for (var i = 0; i < 10; i++) _buildCard(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LiveStreamController>(
      init: LiveStreamController(),
      id: "live_stream",
      builder: (_) {
        return Scaffold(
          body: Column(
            children: [
              _buildView(),
              _buildGridView(),
            ],
          ),
        );
      },
    );
  }
}
