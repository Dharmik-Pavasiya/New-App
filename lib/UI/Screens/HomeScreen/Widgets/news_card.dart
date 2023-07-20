import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/Infrastructure/Commons/Constants/route_constants.dart';
import 'package:newsapp/Infrastructure/Dimension/spacing.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.url,
  });

  final String? imageUrl;
  final String? title;
  final String? description;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteConstants.articleWebView, arguments: url);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: CachedNetworkImage(imageUrl: imageUrl!),
            ),
            Text(
              title!,
              style: const TextStyle(
                fontSize: 17.0,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
            VSpace.spacing_tiny,
            Text(
              description!.trim(),
              style: const TextStyle(
                color: Colors.black54,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
