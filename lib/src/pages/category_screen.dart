import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/category_controller.dart';
import '../widgets/category_card.dart';
import '../widgets/search_field.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final TextEditingController searchController = TextEditingController();
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Find Products",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SearchField(
              controller: searchController,
              hintText: 'Search Store',
              onTapSearch: () {
                print('Searching: ${searchController.text}');
              },
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Obx(() {
              if (categoryController.categories.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 220 / 240,
                ),
                itemCount: categoryController.categories.length,
                itemBuilder: (context, index) {
                  final category = categoryController.categories[index];
                  return CategoryCard(
                    imagePath: category.image,
                    name: category.name,
                    backgroundColor: category.bgColor,
                    borderColor: category.borderColor,
                    onTap: () {
                      print('${category.name} tapped');
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
