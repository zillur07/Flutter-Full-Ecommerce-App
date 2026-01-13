// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:nectar_app/src/pages/account_screen.dart';
// import 'package:nectar_app/src/pages/cart_screen.dart';
// import 'package:nectar_app/src/pages/category_screen.dart';
// import 'package:nectar_app/src/pages/favorurite_screen.dart';
// import 'package:nectar_app/src/pages/home_screen.dart';
// import 'package:nectar_app/src/pages/main_screen.dart';
// import 'package:nectar_app/src/utils/colors.dart';
// import 'package:nectar_app/src/utils/config.dart';
// import 'welcome_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();

//     Timer(const Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => WelcomeScreen()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       body: Center(child: SvgPicture.asset(AppConfig.sLogo, height: 68)),
//     );
//   }
// }

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:nectar_app/src/pages/main_screen.dart';
// import 'package:nectar_app/src/pages/welcome_screen.dart';
// import 'package:nectar_app/src/utils/colors.dart';
// import 'package:nectar_app/src/utils/config.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _checkLoginStatus();
//   }

//   Future<void> _checkLoginStatus() async {
//     await Future.delayed(const Duration(seconds: 3));

//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString("token");

//     if (token != null && token.isNotEmpty) {
//       /// User already logged in
//       Get.offAll(() => MainScreen());
//     } else {
//       /// User not logged in
//       Get.offAll(() => WelcomeScreen());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       body: Center(child: SvgPicture.asset(AppConfig.sLogo, height: 68)),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nectar_app/src/controllers/auth_controller.dart';
import 'package:nectar_app/src/pages/home_screen.dart';
import 'package:nectar_app/src/pages/main_screen.dart';
import 'package:nectar_app/src/pages/welcome_screen.dart';
import 'package:nectar_app/src/utils/colors.dart';
import 'package:nectar_app/src/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    await Future.delayed(const Duration(seconds: 2));

    if (isLoggedIn) {
      Get.offAll(() => MainScreen());
    } else {
      Get.offAll(() => WelcomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(child: SvgPicture.asset(AppConfig.sLogo, height: 68)),
    );
  }
}
