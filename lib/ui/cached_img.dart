import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/app_colors.dart';

class CathedNetworkImgWidget extends StatelessWidget {
  final String imgUrl;
  final double height;
  const CathedNetworkImgWidget({
    super.key,
    required this.imgUrl,
    this.height = 125.0,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: AppColors.colorF8F7F5,
          highlightColor: AppColors.colorA5A9B2.withOpacity(0.3),
          child: Container(
            height: height,
            decoration: BoxDecoration(
              color: AppColors.colorF8F7F5,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
      errorWidget: (context, url, error) => Container(
        color: Colors.red,
      ),
      height: height,
      fit: BoxFit.fill,
    );
  }
}
