import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nectar_app/src/models/product.dart';

// class Product {
//   final int id;
//   final String name;
//   final String categoryName;
//   final String description;
//   final String weight;
//   final String price;
//   final String image;

//   Product({
//     required this.id,
//     required this.name,
//     required this.categoryName,
//     required this.description,
//     required this.weight,
//     required this.price,
//     required this.image,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       name: json['product_name'],
//       categoryName: json['category_name'],
//       description: json['description'],
//       weight: json['weight'],
//       price: json['price'],
//       image: json['image'],
//     );
//   }
// }

class ProductController extends GetxController {
  var isLoading = false.obs;
  var allProducts = <Product>[].obs;
  var exclusiveProducts = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  RxInt quantity = 1.obs;

  void increaseQty() => quantity.value++;
  void decreaseQty() {
    if (quantity.value > 1) quantity.value--;
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    try {
      final url = Uri.parse("https://task.mrshakil.site/api/products/");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List productsJson = data['results'];

        final productsList = productsJson
            .map((e) => Product.fromJson(e))
            .toList();

        allProducts.assignAll(productsList);
        exclusiveProducts.assignAll(productsList.take(3)); // top 3
      } else {
        Get.snackbar("Error", "Failed to load products");
      }
    } catch (e) {
      Get.snackbar("Error", "Server error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
