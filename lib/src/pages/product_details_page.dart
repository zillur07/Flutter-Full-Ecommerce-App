// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:nectar_app/src/controllers/product_details_c%20ontroller.dart';
// import 'package:nectar_app/src/models/product.dart';
// import 'package:nectar_app/src/utils/colors.dart';
// import 'package:nectar_app/src/widgets/custom_button.dart';

// class ProductDetailsPage extends StatelessWidget {
//   final int productId;
//   ProductDetailsPage({
//     super.key,
//     required this.productId,
//     required Product product,
//   });

//   final ProductDetailsController controller = Get.put(
//     ProductDetailsController(),
//   );

//   @override
//   Widget build(BuildContext context) {
//     // Fetch product on page open
//     controller.fetchProduct(productId);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_ios_new_rounded,
//             color: Colors.black,
//           ),
//           onPressed: () => Get.back(),
//         ),
//         // title: const Text(
//         //   'Product Details',
//         //   style: TextStyle(color: Colors.black),
//         // ),
//         elevation: 1,
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         final product = controller.product;

//         return SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// Product Image
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(16),
//                     bottomRight: Radius.circular(16),
//                   ),
//                   color: Color(0xFFF2F3F2),
//                   // border: Border.all(
//                   //   color: Colors.grey.withOpacity(0.3),
//                   //   width: 2,
//                   // ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(30.0),
//                   child: CachedNetworkImage(
//                     imageUrl: product['image'] ?? '',
//                     width: double.infinity,
//                     height: 200,

//                     placeholder: (context, url) =>
//                         const Center(child: CircularProgressIndicator()),
//                     errorWidget: (context, url, error) =>
//                         const Icon(Icons.error),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               /// Name, Weight & Favorite
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             product['product_name'] ?? '',
//                             style: const TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             'Weight: ${product['weight'] ?? ''}',
//                             style: const TextStyle(
//                               fontSize: 16,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         Get.snackbar("Info", "Favorite clicked");
//                       },
//                       icon: const Icon(Icons.favorite_border),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),

//               /// Quantity Selector
//               Obx(
//                 () => Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Row(
//                     children: [
//                       IconButton(
//                         onPressed: controller.decreaseQuantity,
//                         icon: const Icon(Icons.remove),
//                       ),
//                       Container(
//                         height: 34,
//                         width: 34,
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Center(
//                           child: Text(
//                             '${controller.quantity.value}',
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: controller.increaseQuantity,
//                         icon: const Icon(Icons.add, color: AppColors.primary),
//                       ),
//                       Spacer(),
//                       Text(
//                         product['price'] ?? '',
//                         style: const TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.w800,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: const Divider(thickness: 1),
//               ),

//               /// Product Details Expandable
//               Obx(
//                 () => Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Product Details',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: controller.toggleDescription,
//                             icon: Icon(
//                               controller.isDescriptionExpanded.value
//                                   // ? Icons.keyboard_arrow_up
//                                   ? Icons.keyboard_arrow_down
//                                   : Icons.keyboard_arrow_up,
//                               size: 30,
//                             ),
//                           ),
//                         ],
//                       ),
//                       if (controller.isDescriptionExpanded.value)
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8.0),
//                           child: Text(
//                             product['description'] ?? '',
//                             style: const TextStyle(fontSize: 16),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: SizedBox(
//                   width: double.infinity,
//                   height: 55,
//                   child: CustomButton(
//                     text: 'Add To Basket',
//                     onTap: () {
//                       /// Get.to(() => LoginScreen());
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar_app/src/controllers/favorite_controller.dart';
import 'package:nectar_app/src/controllers/product_details_c%20ontroller.dart';
import 'package:nectar_app/src/models/favorite_item.dart';
import 'package:nectar_app/src/utils/colors.dart';
import '../controllers/cart_controller.dart';
import '../widgets/custom_button.dart';

class ProductDetailsPage extends StatelessWidget {
  final int productId;
  final String name;
  final String image;
  final String weight;
  final double price;
  final String description;
  //                             style: const TextStyle(fontSize: 16),

  ProductDetailsPage({
    super.key,
    required this.productId,
    required this.name,
    required this.image,
    required this.weight,
    required this.price,
    required this.description,
  });

  final CartController cartController = Get.put(CartController());
  final CartController cartControllerF = Get.find<CartController>();
  final ProductDetailsController controller = Get.put(
    ProductDetailsController(),
  );

  final FavoriteController favController = Get.put(FavoriteController());

  final RxInt qty = 1.obs;
  final RxBool showDetails = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),

        // title: Text(name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(30.0),
            //   child: Image.network(image, height: 200, width: double.infinity),
            // ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                color: Color(0xFFF2F3F2),
                // border: Border.all(
                //   color: Colors.grey.withOpacity(0.3),
                //   width: 2,
                // ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: CachedNetworkImage(
                  imageUrl: image,
                  width: double.infinity,
                  height: 200,

                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),

            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          weight,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Obx(
                      () => Icon(
                        favController.isFavorite(productId)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: favController.isFavorite(productId)
                            ? Colors.red
                            : Colors.black,
                      ),
                    ),
                    onPressed: () {
                      favController.toggleFavorite(
                        FavoriteItem(
                          id: productId,
                          name: name,
                          image: image,
                          weight: weight,
                          price: price,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: controller.decreaseQty,
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        controller.quantity.value.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: AppColors.primary),
                    onPressed: controller.increaseQty,
                  ),

                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '${(price * controller.quantity.value).toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            const Divider(),
            GestureDetector(
              onTap: () => showDetails.value = !showDetails.value,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Product Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Obx(
                      () => Icon(
                        size: 30,
                        showDetails.value
                            ? Icons.keyboard_arrow_down_sharp
                            : Icons.keyboard_arrow_up_rounded,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => showDetails.value
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        description,
                        style: const TextStyle(fontSize: 16),
                      ),
                    )
                  : const SizedBox(),
            ),
            const SizedBox(height: 24),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: SizedBox(
            //     width: double.infinity,
            //     height: 55,
            //     child: CustomButton(
            //       text: 'Add To Basket',
            //       onTap: () {
            //         cartController.addToCart(productId, qty.value);
            //       },
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                text: 'Add To Basket',
                onTap: () {
                  cartControllerF.addToCart(
                    productId,
                    controller.quantity.value,
                  );
                },
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _qtyButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 24),
      ),
    );
  }
}
