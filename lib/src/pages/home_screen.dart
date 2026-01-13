// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:nectar_app/src/utils/config.dart';
// import 'package:nectar_app/src/utils/colors.dart';
// import 'package:nectar_app/src/widgets/product_card.dart';
// import 'package:nectar_app/src/widgets/search_field.dart';

// class Product {
//   final String image;
//   final String name;
//   final String kg;
//   final String price;

//   Product({
//     required this.image,
//     required this.name,
//     required this.kg,
//     required this.price,
//   });
// }

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});
//   final TextEditingController searchController = TextEditingController();

//   // Example products list
//   final List<Product> products = List.generate(
//     6,
//     (index) => Product(
//       image: 'assets/images/product$index.png',
//       name: 'Product $index',
//       kg: '${(index + 1) * 0.5} kg',
//       price: '\$${(index + 1) * 2}',
//     ),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(
//         backgroundColor: AppColors.background,
//         elevation: 2,
//         centerTitle: true,
//         title: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SvgPicture.asset(AppConfig.logo, height: 30),
//             const SizedBox(height: 4),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SvgPicture.asset('assets/svg/location.svg', height: 16),
//                 const SizedBox(width: 4),
//                 Text(
//                   'Dhaka, Banassre',
//                   style: const TextStyle(
//                     fontSize: 12,
//                     color: Colors.black87,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SearchField(
//               controller: searchController,
//               hintText: 'Search Store',
//               onTapSearch: () {
//                 print('Searching: ${searchController.text}');
//               },
//             ),
//             const SizedBox(height: 20),
//             Image.asset('assets/home_banner.png'),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Exclusive Offers',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   'See all',
//                   style: TextStyle(
//                     color: AppColors.primary,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               height: 250,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) {
//                   final product = products[index];

//                   return ProductCard(
//                     imagePath: product.image,
//                     name: product.name,
//                     kg: product.kg,
//                     price: product.price,
//                     onTapIcon: () {
//                       print('Icon tapped for ${product.name}');
//                     },
//                   );
//                 },
//                 itemCount: 3,
//                 shrinkWrap: true,

//                 physics: const BouncingScrollPhysics(),
//               ),
//             ),
//             const SizedBox(height: 20),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'All Products',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   'See all',
//                   style: TextStyle(
//                     color: AppColors.primary,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),

//             // ✅ GridView inside Column using shrinkWrap & physics
//             GridView.builder(
//               shrinkWrap: true,

//               // physics: const NeverScrollableScrollPhysics(),
//               physics: const BouncingScrollPhysics(),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 0.70,
//                 mainAxisSpacing: 2,
//                 crossAxisSpacing: 2,
//               ),
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 final product = products[index];
//                 return ProductCard(
//                   imagePath: product.image,
//                   name: product.name,
//                   kg: product.kg,
//                   price: product.price,
//                   onTapIcon: () {
//                     print('Icon tapped for ${product.name}');
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar_app/src/controllers/product_controller.dart';
import 'package:nectar_app/src/pages/product_details_page.dart';
import 'package:nectar_app/src/widgets/product_card.dart';
import 'package:nectar_app/src/widgets/search_field.dart';
import 'package:nectar_app/src/utils/colors.dart';
import 'package:nectar_app/src/utils/config.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController searchController = TextEditingController();
  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 2,
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppConfig.logo, height: 30),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/svg/location.svg', height: 16),
                const SizedBox(width: 4),
                const Text(
                  'Dhaka, Banassre',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchField(
                controller: searchController,
                hintText: 'Search Store',
                onTapSearch: () {
                  print('Searching: ${searchController.text}');
                },
              ),
              const SizedBox(height: 20),
              Image.asset('assets/home_banner.png'),
              const SizedBox(height: 20),

              /// Exclusive Offers
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Exclusive Offers',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.exclusiveProducts.length,
                  itemBuilder: (context, index) {
                    final product = controller.exclusiveProducts[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => ProductDetailsPage(
                            productId: product.id,
                            name: product.name,
                            image: product.image,
                            weight: product.weight,
                            price: double.tryParse(product.price) ?? 0.0,
                            description: product.description,
                          ),
                        );
                      },
                      child: ProductCard(
                        imagePath: product.image,
                        name: product.name,
                        kg: product.weight,
                        price: product.price,
                        onTapIcon: () {
                          print('Icon tapped for ${product.name}');
                        },
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              /// All Products
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'All Products',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.70,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                ),
                itemCount: controller.allProducts.length,
                itemBuilder: (context, index) {
                  final product = controller.allProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => ProductDetailsPage(
                          productId: product.id,
                          name: product.name,
                          image: product.image,
                          weight: product.weight,
                          price: double.tryParse(product.price) ?? 0.0,
                          description: product.description,
                        ),
                      );
                    },
                    child: ProductCard(
                      imagePath: product.image,
                      name: product.name,
                      kg: product.weight,
                      price: product.price,
                      onTapIcon: () {
                        print('Icon tapped for ${product.name}');
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
