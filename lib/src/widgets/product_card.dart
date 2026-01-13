import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar_app/src/utils/colors.dart';

class ProductCard extends StatelessWidget {
  final String imagePath; // product image
  final String name;
  final String kg;
  final String price;
  final VoidCallback? onTapIcon;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.kg,
    required this.price,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 160,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 2.0, color: Colors.grey.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CachedNetworkImage(
                imageUrl: imagePath,
                height: 90,
                width: double.infinity,

                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),

          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              kg,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),

          const Spacer(),

          // Bottom row: price left, icon right
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                GestureDetector(
                  onTap: onTapIcon,
                  // child: SvgPicture.asset(
                  //   'assets/icons/placeholder.svg',
                  //   height: 24,
                  //   width: 24,
                  // ),
                  child: const Icon(
                    Icons.add_box_rounded,
                    color: AppColors.primary,
                    size: 34,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
