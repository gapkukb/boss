import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class BossImagePicker extends StatefulWidget {
  final Widget child;
  const BossImagePicker({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _BossImagePickerState createState() => _BossImagePickerState();
}

class _BossImagePickerState extends State<BossImagePicker> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widget.child,
      onTap: _pick,
    );
  }

  Future<void> _pick() async {
    final List<AssetEntity>? result = await AssetPicker.pickAssets(context);
    print(result);
// Capture a photo.
    // final XFile? photo = await picker.pickImage(source: ImageSource.camera);
// // Pick a video.
//     final XFile? galleryVideo = await picker.pickVideo(source: ImageSource.gallery);
// // Capture a video.
//     final XFile? cameraVideo = await picker.pickVideo(source: ImageSource.camera);
// // Pick multiple images.
//     final List<XFile> images = await picker.pickMultiImage();
// // Pick singe image or video.
//     final XFile? media = await picker.pickMedia();
// // Pick multiple images and videos.
//     final List<XFile> medias = await picker.pickMultipleMedia();
  }
}
