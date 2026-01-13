import 'package:get/get.dart';

// class CartItem {
//   final String image;
//   final String name;
//   final double price;
//   RxInt quantity = 1.obs;

//   CartItem({required this.image, required this.name, required this.price});
// }

// class CartController extends GetxController {
//   var cartItems = <CartItem>[].obs;

//   @override
//   void onInit() {
//     super.onInit();

//     // 🔹 Temporary dummy data
//     cartItems.addAll([
//       CartItem(image: 'assets/images/product1.png', name: 'Egg', price: 4.5),
//       CartItem(image: 'assets/images/product5.png', name: 'Drink', price: 2.0),
//       CartItem(image: 'assets/images/product3.png', name: 'Apple', price: 2.0),
//     ]);
//   }

//   double get totalAmount =>
//       cartItems.fold(0, (sum, item) => sum + item.price * item.quantity.value);

//   void increaseQty(CartItem item) {
//     item.quantity.value++;
//   }

//   void decreaseQty(CartItem item) {
//     if (item.quantity.value > 1) {
//       item.quantity.value--;
//     }
//   }

//   void removeItem(CartItem item) {
//     cartItems.remove(item);
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:nectar_app/src/pages/cart_screen.dart';
// import 'package:nectar_app/src/pages/main_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class CartItem {
//   final int id;
//   final int productId;
//   final String name;
//   final String image;
//   final double price;
//   RxInt quantity;

//   CartItem({
//     required this.id,
//     required this.productId,
//     required this.name,
//     required this.image,
//     required this.price,
//     int quantity = 1,
//   }) : quantity = quantity.obs;
// }

// class CartController extends GetxController {
//   var cartItems = <CartItem>[].obs;

//   double get totalAmount =>
//       cartItems.fold(0, (sum, item) => sum + item.price * item.quantity.value);

//   /// Fetch cart items
//   Future<void> fetchCartItems() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';

//       if (token.isEmpty) return;

//       final url = Uri.parse('https://task.mrshakil.site/api/cart/');
//       final response = await http.get(
//         url,
//         headers: {'Authorization': 'Token $token'},
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         final List<CartItem> loadedItems = [];
//         for (var item in data['results']) {
//           loadedItems.add(
//             CartItem(
//               id: item['id'],
//               productId: item['product_detail']['id'],
//               name: item['product_detail']['product_name'],
//               image: item['product_detail']['image'],
//               price: double.parse(item['product_detail']['price']),
//               quantity: item['qty'],
//             ),
//           );
//         }
//         cartItems.assignAll(loadedItems);
//       }
//     } catch (e) {
//       print('Fetch cart error: $e');
//     }
//   }

//   /// Add or update product in cart
//   Future<void> addToCart(int productId, int qty) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';

//       if (token.isEmpty) {
//         Get.snackbar('Error', 'Please login first');
//         return;
//       }

//       final url = Uri.parse('https://task.mrshakil.site/api/cart/');
//       final response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Token $token',
//         },
//         body: jsonEncode({
//           'product': productId, // ✅ FIXED
//           'qty': qty,
//         }),
//       );

//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         Get.snackbar('Success', 'Item added to cart');
//         fetchCartItems();
//         Get.to(() => MainScreen()); // Navigate to CartPage
//       } else {
//         final data = jsonDecode(response.body);
//         Get.snackbar('Error', data.toString());
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'Server error');
//       print(e);
//     }
//   }

//   void increaseQty(CartItem item) => item.quantity.value++;
//   void decreaseQty(CartItem item) {
//     if (item.quantity.value > 1) item.quantity.value--;
//   }

//   void removeItem(CartItem item) => cartItems.remove(item);
//   Future<void> clearCart() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       if (token.isEmpty) return;

//       final url = Uri.parse('https://task.mrshakil.site/api/cart/clear/');
//       final response = await http.delete(
//         url,
//         headers: {'Authorization': 'Token $token'},
//       );

//       if (response.statusCode == 200) {
//         cartItems.clear();
//         Get.snackbar('Success', 'Cart cleared');
//       } else {
//         Get.snackbar('Error', 'Failed to clear cart');
//       }
//     } catch (e) {
//       print('Clear cart error: $e');
//     }
//   }
// }

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nectar_app/src/pages/main_screen.dart';
import 'package:nectar_app/src/pages/order_accept_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartItem {
  final int id;
  final int productId;
  final String name;
  final String image;
  final double price;
  RxInt quantity;

  CartItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required int quantity,
  }) : quantity = quantity.obs;
}

class CartController extends GetxController {
  final cartItems = <CartItem>[].obs;
  final isLoading = false.obs;

  /// ---------------- TOTAL ----------------
  double get totalAmount =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.quantity.value);

  /// ---------------- INIT ----------------
  @override
  void onInit() {
    fetchCartItems();
    super.onInit();
  }

  /// ---------------- TOKEN ----------------
  Future<String> _token() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  /// ---------------- FETCH CART ----------------
  Future<void> fetchCartItems() async {
    try {
      isLoading.value = true;
      final token = await _token();
      if (token.isEmpty) return;

      final response = await http.get(
        Uri.parse('https://task.mrshakil.site/api/cart/'),
        headers: {'Authorization': 'Token $token'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        cartItems.assignAll(
          data['results'].map<CartItem>((item) {
            return CartItem(
              id: item['id'],
              productId: item['product_detail']['id'],
              name: item['product_detail']['product_name'],
              image: item['product_detail']['image'],
              price: double.parse(item['product_detail']['price']),
              quantity: item['qty'],
            );
          }).toList(),
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load cart');
    } finally {
      isLoading.value = false;
    }
  }

  /// ---------------- ADD TO CART ----------------
  Future<void> addToCart(int productId, int qty) async {
    try {
      final token = await _token();
      if (token.isEmpty) return;

      final response = await http.post(
        Uri.parse('https://task.mrshakil.site/api/cart/'),
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'product': productId, 'qty': qty}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        await fetchCartItems();
        Get.snackbar('Success', 'Added to cart');
        Get.to(() => MainScreen());
      } else {
        Get.snackbar('Error', response.body);
      }
    } catch (e) {
      Get.snackbar('Error', 'Server error');
    }
  }

  /// ---------------- UPDATE QTY ----------------
  Future<void> updateQty(CartItem item, int qty) async {
    try {
      final token = await _token();
      if (token.isEmpty) return;

      final response = await http.patch(
        Uri.parse('https://task.mrshakil.site/api/cart/${item.id}/'),
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'qty': qty}),
      );

      if (response.statusCode == 200) {
        item.quantity.value = qty;
      }
    } catch (e) {
      Get.snackbar('Error', 'Qty update failed');
    }
  }

  void increaseQty(CartItem item) {
    updateQty(item, item.quantity.value + 1);
  }

  void decreaseQty(CartItem item) {
    if (item.quantity.value > 1) {
      updateQty(item, item.quantity.value - 1);
    }
  }

  /// ---------------- REMOVE ITEM ----------------
  Future<void> removeItem(CartItem item) async {
    try {
      final token = await _token();
      if (token.isEmpty) return;

      final response = await http.delete(
        Uri.parse('https://task.mrshakil.site/api/cart/${item.id}/'),
        headers: {'Authorization': 'Token $token'},
      );

      if (response.statusCode == 204) {
        cartItems.remove(item);
        Get.snackbar('Removed', 'Item removed');
      }
    } catch (e) {
      Get.snackbar('Error', 'Remove failed');
    }
  }

  /// ---------------- CLEAR CART ----------------
  Future<void> clearCart() async {
    try {
      final token = await _token();
      if (token.isEmpty) return;

      final response = await http.delete(
        Uri.parse('https://task.mrshakil.site/api/cart/clear/'),
        headers: {'Authorization': 'Token $token'},
      );

      if (response.statusCode == 200) {
        cartItems.clear();
        Get.snackbar('Success', 'Cart cleared');
      }
    } catch (e) {
      Get.snackbar('Error', 'Clear cart failed');
    }
  }

  //---------------Order Placement-----------

  Future<void> placeOrder({
    required String name,
    required String email,
    required String phone,
    required String address,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      if (token.isEmpty) {
        Get.snackbar('Error', 'Please login first');
        return;
      }

      final items = cartItems
          .map((e) => {"product_id": e.productId, "qty": e.quantity.value})
          .toList();

      final response = await http.post(
        Uri.parse('https://task.mrshakil.site/api/order/create/'),
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "customer_name": name,
          "email": email,
          "phone": phone,
          "address": address,
          "items": items,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        cartItems.clear();
        // Get.back(); // close bottomsheet
        Get.off(() => const OrderAcceptScreen());
        Get.snackbar(
          "Order Placed",
          "Order No: ${data['order_no']}",
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar("Error", data.toString());
      }
    } catch (e) {
      Get.snackbar("Error", "Order failed");
    }
  }
}
