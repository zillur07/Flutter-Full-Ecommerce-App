// import 'package:get/get.dart';
// import 'package:flutter/material.dart';

// class LoginController extends GetxController {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   var isPasswordHidden = true.obs;

//   void togglePassword() {
//     isPasswordHidden.value = !isPasswordHidden.value;
//   }

//   void login() {
//     final email = emailController.text;
//     final password = passwordController.text;

//     if (email.isEmpty || password.isEmpty) {
//       Get.snackbar(
//         'Error',
//         'Email and Password required',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       return;
//     }

//     // login logic here
//     print('Email: $email');
//     print('Password: $password');
//   }

//   @override
//   void onClose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.onClose();
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nectar_app/src/pages/main_screen.dart';
import 'package:nectar_app/src/pages/welcome_screen.dart';
import 'package:nectar_app/src/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/home_screen.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isPasswordHidden = true.obs;
  var isLoading = false.obs;

  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email and Password are required");
      return;
    }

    isLoading.value = true;

    try {
      final url = Uri.parse("${AppConfig.apiBaseUrl}login/");
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        final prefs = await SharedPreferences.getInstance();

        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('token', data['token']);
        await prefs.setString('user', jsonEncode(data['user']));
        await prefs.setString('full_name', data['user']['full_name']);
        await prefs.setString('email', data['user']['email']);

        emailController.clear();
        passwordController.clear();

        Get.offAll(() => MainScreen());
      } else {
        Get.snackbar("Error", data['message'] ?? "Login failed");
      }
    } catch (e) {
      Get.snackbar("Error", "Server error");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Get.offAll(() => WelcomeScreen());
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
