import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar_app/src/pages/login_screen.dart';
import 'package:nectar_app/src/utils/colors.dart';
import 'package:nectar_app/src/utils/config.dart';
import '../controllers/signup_controller.dart';
import '../widgets/custom_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              /// Logo
              Center(child: SvgPicture.asset(AppConfig.logo, height: 50)),

              const SizedBox(height: 24),

              const Text(
                'Sign Up',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),
              const Text(
                'Create your account',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 30),

              /// Full Name
              const Text(
                'Full Name',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textSecondary,
                ),
              ),
              TextField(
                controller: controller.fullNameController,
                keyboardType: TextInputType.name,
              ),

              const SizedBox(height: 20),

              /// Email
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textSecondary,
                ),
              ),
              TextField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),

              /// Password
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textSecondary,
                ),
              ),
              Obx(
                () => TextField(
                  controller: controller.passwordController,
                  obscureText: controller.isPasswordHidden.value,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: controller.togglePassword,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Re-Password
              const Text(
                'Re-Password',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textSecondary,
                ),
              ),
              Obx(
                () => TextField(
                  controller: controller.rePasswordController,
                  obscureText: controller.isRePasswordHidden.value,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isRePasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: controller.toggleRePassword,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// Sign Up Button
              Obx(
                () => CustomButton(
                  text: controller.isLoading.value
                      ? 'Signing Up...'
                      : 'Sign Up',
                  onTap: controller.isLoading.value
                      ? () {
                          // Do nothing while loading
                        }
                      : () => controller.signUp(),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(LoginScreen());
                    },
                    child: const Text(
                      ' Login',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
