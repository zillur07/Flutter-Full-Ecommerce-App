import 'package:flutter/material.dart';
import 'package:nectar_app/src/models/favorite_item.dart';
import 'package:nectar_app/src/widgets/favorite_item_tile.dart';

class FavoruriteScreen extends StatelessWidget {
  const FavoruriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FavoriteItem> favorites = [
      FavoriteItem(
        image: "assets/images/product3.png",
        name: "Apple",
        quantity: "1 Kg",
        price: 5.50,
      ),
      FavoriteItem(
        image: "assets/images/product2.png",
        name: "Potetuo",
        quantity: "12 pcs",
        price: 3.20,
      ),
      FavoriteItem(
        image: "assets/images/product5.png",
        name: "Rc",
        quantity: "12 pcs",
        price: 3.20,
      ),
      FavoriteItem(
        image: "assets/images/product1.png",
        name: "Egg",
        quantity: "12 pcs",
        price: 3.20,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Favorurites",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1.5, color: Colors.grey.withOpacity(0.3)),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              // TODO: Add all favorite items to cart
              print("Add All To Cart clicked");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // change to AppColors.primary
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
            ),
            child: const Text(
              "Add All To Cart",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            return FavoriteItemTile(
              item: favorites[index],
              isLast: index == favorites.length - 1,
            );
          },
        ),
      ),
    );
  }
}
