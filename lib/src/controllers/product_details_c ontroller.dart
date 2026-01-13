// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ProductDetailsController extends GetxController {
//   var quantity = 1.obs;
//   var isDescriptionExpanded = true.obs;

//   void increaseQuantity() => quantity.value++;
//   void decreaseQuantity() {
//     if (quantity.value > 1) quantity.value--;
//   }

//   void toggleDescription() =>
//       isDescriptionExpanded.value = !isDescriptionExpanded.value;

//   // Product Data from API
//   var product = {}.obs;
//   var isLoading = true.obs;

//   Future<void> fetchProduct(int productId) async {
//     try {
//       isLoading.value = true;
//       final url = Uri.parse(
//         'https://task.mrshakil.site/api/products/$productId/',
//       );
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         product.value = data;
//       } else {
//         Get.snackbar("Error", "Failed to load product");
//       }
//     } catch (e) {
//       Get.snackbar("Error", "Server error");
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nectar_app/src/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailsController extends GetxController {
  var quantity = 1.obs;
  var isLoading = false.obs;

  void increaseQty() {
    quantity.value++;
  }

  void decreaseQty() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  Future<void> addToCart(int productId) async {
    isLoading.value = true;

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      if (token.isEmpty) {
        Get.snackbar("Error", "Please login first");
        return;
      }

      final url = Uri.parse("${AppConfig.apiBaseUrl}cart/");
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Token $token",
        },
        body: jsonEncode({"product_id": productId, "qty": quantity.value}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Success", data['message'] ?? "Added to cart");
      } else {
        Get.snackbar("Error", data.toString());
      }
    } catch (e) {
      Get.snackbar("Error", "Server error");
    } finally {
      isLoading.value = false;
    }
  }
}
