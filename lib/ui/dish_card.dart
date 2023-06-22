import 'package:flutter/material.dart';
import 'package:invite_application/utils/app_colors.dart';

import 'cached_img.dart';

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
    return Stack(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 109,
              decoration: BoxDecoration(
                color: AppColors.colorF8F7F5,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: CathedNetworkImgWidget(imgUrl: imgUrl),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 1,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Text(
                      title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
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
    );
  }
}
