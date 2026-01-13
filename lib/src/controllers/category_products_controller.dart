import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryProductsController extends GetxController {
  var products = <dynamic>[].obs;
  var isLoading = false.obs;

  final String categoryName;

  CategoryProductsController({required this.categoryName});

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      final url = Uri.parse(
        'https://task.mrshakil.site/api/products/?category__cateogry_name=$categoryName',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        products.assignAll(data['results']);
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
