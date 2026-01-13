import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.backgroundColor,
    required this.borderColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              // child: Image.network(imagePath, height: 100, fit: BoxFit.contain),
              child: CachedNetworkImage(
                imageUrl: imagePath,
                height: 100,
                width: double.infinity,

                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Center(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
