import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/order_model.dart';

class OrdersController extends GetxController {
  var orders = <OrderModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    try {
      isLoading.value = true;

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      if (token.isEmpty) return;

      final url = Uri.parse('https://task.mrshakil.site/api/orders/');
      final response = await http.get(
        url,
        headers: {'Authorization': 'Token $token'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List list = data['results'];

        orders.assignAll(list.map((e) => OrderModel.fromJson(e)).toList());
      }
    } catch (e) {
      print('Order fetch error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
