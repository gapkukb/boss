import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class NotificationMessagePage extends GetView<NotificationMessageController> {
  const NotificationMessagePage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("NotificationMessagePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationMessageController>(
      init: NotificationMessageController(),
      id: "notification_message",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("notification_message")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
