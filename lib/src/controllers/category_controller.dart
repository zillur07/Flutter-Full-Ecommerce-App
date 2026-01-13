import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/category.dart';

class CategoryController extends GetxController {
  var categories = <Category>[].obs;

  final List<Color> bgColors = [
    Colors.pink.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.orange.shade100,
    Colors.purple.shade100,
  ];

  final List<Color> borderColors = [
    Colors.pink.shade400,
    Colors.green.shade400,
    Colors.blue.shade400,
    Colors.orange.shade400,
    Colors.purple.shade400,
  ];

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      final url = Uri.parse("https://task.mrshakil.site/api/categories/");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List results = data['results'];

        categories.clear();

        for (int i = 0; i < results.length; i++) {
          final item = results[i];
          categories.add(
            Category(
              id: item['id'],
              name: item['cateogry_name'], // API te spelling: cateogry_name
              image: item['category_image'],
              bgColor: bgColors[i % bgColors.length],
              borderColor: borderColors[i % borderColors.length],
            ),
          );
        }
      } else {
        Get.snackbar("Error", "Failed to load categories");
      }
    } catch (e) {
      Get.snackbar("Error", "Server error: $e");
    }
  }
}
