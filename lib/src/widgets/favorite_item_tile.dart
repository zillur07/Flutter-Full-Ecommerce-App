import 'package:flutter/material.dart';
import 'package:nectar_app/src/models/favorite_item.dart';

class FavoriteItemTile extends StatelessWidget {
  final FavoriteItem item;
  final bool isLast;

  const FavoriteItemTile({super.key, required this.item, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              /// Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(item.image, width: 60, height: 60),
              ),

              const SizedBox(width: 30),

              /// Name + Quantity
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
                      item.quantity,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              /// Price
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
        ),

        /// Divider (last item বাদ)
        if (!isLast) Divider(height: 1, color: Colors.grey.withOpacity(0.3)),
      ],
    );
  }
}
