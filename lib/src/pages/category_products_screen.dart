import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/category_products_controller.dart';
import '../widgets/product_card.dart';
import '../pages/product_details_page.dart'; // Ensure your ProductDetailsPage path

class CategoryProductsScreen extends StatelessWidget {
  final String categoryName;

  CategoryProductsScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final CategoryProductsController controller = Get.put(
      CategoryProductsController(categoryName: categoryName),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          categoryName,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {
              // Implement filter functionality here
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1.5, color: Colors.grey.withOpacity(0.3)),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.products.isEmpty) {
          return const Center(child: Text("No products found"));
        }

        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 180 / 260, // ProductCard এর height/width
          ),
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];

            return ProductCard(
              imagePath: product['image'] ?? '', // 👈 null-safe
              name: product['product_name'] ?? 'Unknown Product',
              kg: product['weight']?.toString() ?? '',
              price: product['price'] != null ? "\$${product['price']}" : "\$0",
              onTapIcon: () {
                Get.to(
                  () => ProductDetailsPage(
                    productId: product['id'],
                    name: product['product_name'] ?? 'Unknown Product',
                    image: product['image'] ?? '',
                    weight: product['weight']?.toString() ?? '',
                    price:
                        double.tryParse(product['price']?.toString() ?? '0') ??
                        0,
                    description: product['description'] ?? "No description",
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }
}
