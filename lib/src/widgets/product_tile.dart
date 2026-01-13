import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final int id;
  final String name;
  final String image;
  final String weight;
  final double price;
  final VoidCallback onTap;

  const ProductTile({
    super.key,
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.weight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Image.network(image, width: 60, height: 60, fit: BoxFit.cover),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(weight, style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              Text(
                "\$${price.toStringAsFixed(2)}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
