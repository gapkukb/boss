import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class LiveStreamPage extends GetView<LiveStreamController> {
  const LiveStreamPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("LiveStreamPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LiveStreamController>(
      init: LiveStreamController(),
      id: "live_stream",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("live_stream")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
