import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BossNetworkImage extends StatelessWidget {
  final String imageUrl;
  final Widget Function(BuildContext, ImageProvider<Object>)? builder;

  const BossNetworkImage(
    this.imageUrl, {
    Key? key,
    this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: builder,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
