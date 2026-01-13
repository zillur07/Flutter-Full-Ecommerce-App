import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nectar_app/src/pages/main_screen.dart';
import 'package:nectar_app/src/pages/my_orders_screen.dart';
import 'package:nectar_app/src/widgets/custom_button.dart';

class OrderAcceptScreen extends StatelessWidget {
  const OrderAcceptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 130),
          Center(child: SvgPicture.asset("assets/svg/order_success.svg")),
          const SizedBox(height: 20),
          Center(
            child: const Text(
              "Your order has been",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: const Text(
              "accepted",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: const Text(
              "Your items has been placed and is on",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          Center(
            child: const Text(
              "its way to being processed.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: CustomButton(
                text: 'Track Order',
                onTap: () {
                  Get.offAll(() => MainScreen());
                },
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => MainScreen());
            },
            child: Container(
              child: const Text(
                "Back to home",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
