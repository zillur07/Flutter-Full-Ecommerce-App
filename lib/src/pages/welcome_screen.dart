import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar_app/src/pages/login_screen.dart';
import 'package:nectar_app/src/utils/config.dart';
import 'package:nectar_app/src/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppConfig.welcomeImage),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Dark overlay (optional but looks nice)
          Container(color: Colors.black.withOpacity(0.4)),

          /// Content
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 500),

                /// Text Section
                const Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 48,
                  ),
                ),

                const Text(
                  'to our store',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  'Get your groceries in as fast as one hour',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),

                const Spacer(),

                /// Get Started Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: CustomButton(
                    text: 'Get Started',
                    onTap: () {
                      Get.to(() => LoginScreen());
                    },
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
