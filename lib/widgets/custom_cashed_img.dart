import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCashedImage extends StatelessWidget {
  final String? imageUrl;
  final Color filterColor;
  final BoxShape shape;

  const CustomCashedImage({
    @required this.imageUrl,
    this.filterColor = Colors.transparent,
    this.shape = BoxShape.rectangle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      placeholderFadeInDuration: const Duration(milliseconds: 300),
      fadeInDuration: const Duration(milliseconds: 300),
      fadeOutDuration: const Duration(milliseconds: 300),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      placeholder:
          (context, url) => Container(
            height: 56,
            width: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
      imageBuilder:
          (context, imageProvider) =>
              _item(context, image: imageProvider, filteredColor: filterColor),
    );
  }

  Widget _item(
    BuildContext context, {
    ImageProvider<Object>? image,
    Color? filteredColor,
  }) {
    return Container(
      height: 56,
      width: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        image: DecorationImage(image: image!, fit: BoxFit.cover),
      ),
    );
  }
}
