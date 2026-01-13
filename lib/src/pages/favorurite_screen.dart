import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:nectar_app/src/widgets/favorite_item_tile.dart';

import '../controllers/favorite_controller.dart';

class FavoruriteScreen extends StatelessWidget {
  const FavoruriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteController favController = Get.put(FavoriteController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Favorites",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1.5, color: Colors.grey.withOpacity(0.3)),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Obx(
        () => favController.favorites.isEmpty
            ? const Center(child: Text("No favorites yet"))
            : ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                itemCount: favController.favorites.length,
                itemBuilder: (context, index) {
                  final item = favController.favorites[index];
                  return FavoriteItemTile(
                    item: item,
                    isLast: index == favController.favorites.length - 1,
                  );
                },
              ),
      ),
    );
  }
}
