import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nectar_app/src/pages/account_screen.dart';
import 'package:nectar_app/src/pages/cart_screen.dart';
import 'package:nectar_app/src/pages/category_screen.dart';
import 'package:nectar_app/src/pages/favorurite_screen.dart';
import 'package:nectar_app/src/pages/home_screen.dart';

import '../utils/colors.dart';
import '../controllers/bottom_nav_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> pages = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    FavoruriteScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[controller.currentIndex.value],

        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: Colors.black,
            selectedFontSize: 13,
            unselectedFontSize: 13,

            items: [
              _navItem("assets/svg/shop.svg", "Shop", 0),
              _navItem("assets/svg/explore.svg", "Explore", 1),
              _navItem("assets/svg/cart.svg", "Cart", 2),
              _navItem("assets/svg/favorite.svg", "Favourite", 3),
              _navItem("assets/svg/account.svg", "Account", 4),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _navItem(String icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        height: 22,
        color: controller.currentIndex.value == index
            ? AppColors.primary
            : Colors.grey,
      ),
      label: label,
    );
  }
}
