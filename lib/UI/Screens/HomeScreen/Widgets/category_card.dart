import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../Infrastructure/Commons/Constants/color_constants.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key, required this.imageUrl, required this.categoryName});

  final String imageUrl;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 120.0,
              height: 60.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 120.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.32),
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Center(
              child: Text(
                categoryName,
                style: const TextStyle(
                  color: ColorConstants.kWhite,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
