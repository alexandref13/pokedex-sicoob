import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedImageWidget extends StatelessWidget {
  final String url;

  const CustomCachedImageWidget({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(
        value: downloadProgress.progress,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
