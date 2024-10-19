import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SearchingPage extends GetView<SearchingController> {
  const SearchingPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("SearchingPage1111"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchingController>(
      init: SearchingController(),
      id: "searching",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("searching")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
