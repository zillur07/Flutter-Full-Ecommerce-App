import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/favorite_item.dart';
import '../controllers/favorite_controller.dart';
import '../pages/product_details_page.dart';

class FavoriteItemTile extends StatelessWidget {
  final FavoriteItem item;
  final bool isLast;

  const FavoriteItemTile({super.key, required this.item, required this.isLast});

  @override
  Widget build(BuildContext context) {
    final FavoriteController favController = Get.put(FavoriteController());

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: InkWell(
            onTap: () {
              Get.to(
                () => ProductDetailsPage(
                  productId: item.id,
                  name: item.name,
                  image: item.image,
                  weight: item.weight,
                  price: item.price,
                  description: item.description ?? "No description",
                ),
              );
            },
            child: Row(
              children: [
                /// Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item.image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 20),

                /// Name + Weight
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.weight,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),

                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "\$${item.price.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),

                        const SizedBox(width: 8),

                        /// Arrow
                        const Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                    SizedBox(height: 10),

                    /// Delete icon under price
                    GestureDetector(
                      onTap: () {
                        favController.toggleFavorite(item);
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.delete, size: 25, color: Colors.red),
                          // SizedBox(width: 4),
                          // Text(
                          //   "Remove",
                          //   style: TextStyle(fontSize: 13, color: Colors.red),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),

                /// Price
              ],
            ),
          ),
        ),

        /// Divider
        if (!isLast) Divider(height: 1, color: Colors.grey.withOpacity(0.3)),
      ],
    );
  }
}
