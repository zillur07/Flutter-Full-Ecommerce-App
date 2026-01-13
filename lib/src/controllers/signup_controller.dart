import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nectar_app/src/pages/login_screen.dart';

class SignUpController extends GetxController {
  // TextControllers
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  // Password hide/show
  var isPasswordHidden = true.obs;
  var isRePasswordHidden = true.obs;

  void togglePassword() => isPasswordHidden.value = !isPasswordHidden.value;
  void toggleRePassword() =>
      isRePasswordHidden.value = !isRePasswordHidden.value;

  // Loading state
  var isLoading = false.obs;

  // API Sign Up
  Future<void> signUp() async {
    final fullName = fullNameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final rePassword = rePasswordController.text.trim();

    // Validation
    if (fullName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        rePassword.isEmpty) {
      Get.snackbar(
        "Error",
        "All fields are required",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (password != rePassword) {
      Get.snackbar(
        "Error",
        "Passwords do not match",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    try {
      final url = Uri.parse("https://task.mrshakil.site/api/register/");
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "full_name": fullName,
          "email": email,
          "password": password,
          "confirm_password": rePassword,
          "user_type": "Customer",
        }),
      );

      final data = jsonDecode(response.body);

      // ✅ Correct success check according to API
      if (response.statusCode >= 200 &&
          response.statusCode < 300 &&
          data['success'] == true) {
        Get.snackbar(
          "Success",
          data['message'] ?? "Account created successfully",
          snackPosition: SnackPosition.TOP,
        );

        // Clear fields
        fullNameController.clear();
        emailController.clear();
        passwordController.clear();
        rePasswordController.clear();

        // Wait a bit to show the snackbar before navigation
        await Future.delayed(const Duration(milliseconds: 600));

        // Navigate to LoginScreen
        Get.offAll(() => LoginScreen());
      } else {
        // If API returns success=false or other issue
        Get.snackbar(
          "Error",
          data['message'] ?? "Something went wrong",
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Server error: $e",
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.onClose();
  }
}
