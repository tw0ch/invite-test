import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invite_application/pages/detail/detail_page.dart';
import 'package:invite_application/utils/app_colors.dart';

import '../common_setup/routes.dart';

class DishWidget extends StatelessWidget {
  final String title;
  final String imgUrl;
  final VoidCallback onTap;

  const DishWidget({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 109,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: _buildCachedImg(imgUrl),
                ),
                decoration: BoxDecoration(
                  color: AppColors.colorF8F7F5,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 1,
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCachedImg(String imgUrl) {
    if (imgUrl != null) {
      return CachedNetworkImage(
        imageUrl: imgUrl,
        placeholder: (context, url) => Container(
          color: Colors.red,
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.red,
        ),
        height: 125,
        fit: BoxFit.fill,
      );
    } else {
      return Container(
        color: Colors.red,
      );
    }
  }
}
