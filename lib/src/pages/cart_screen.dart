import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../widgets/cart_item_tile.dart';
import '../utils/colors.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final CartController controller = Get.put(CartController());

  Widget _inputField(
    String hint,
    TextEditingController controller, {
    required IconData icon,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        maxLines: maxLines,

        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),
    );
  }

  void showCheckoutBottomSheet(
    BuildContext context,
    CartController controller,
  ) {
    final nameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final addressCtrl = TextEditingController();

    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: AppColors.textFieldBg,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Header
              Row(
                children: [
                  const Text(
                    "Checkout",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),

              const SizedBox(height: 12),
              const Divider(),

              /// Total Cost
              Row(
                children: [
                  const Text("Total Cost", style: TextStyle(fontSize: 16)),
                  const Spacer(),
                  Obx(
                    () => Text(
                      "\$${controller.totalAmount.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),
              const Divider(),

              const SizedBox(height: 12),

              /// Form Fields
              _inputField("Name", nameCtrl, icon: Icons.person),

              _inputField("Email Address", emailCtrl, icon: Icons.email),

              _inputField("Phone Number", phoneCtrl, icon: Icons.phone),

              _inputField(
                "Address",
                addressCtrl,
                icon: Icons.location_on,
                maxLines: 3,
              ),

              const SizedBox(height: 16),

              /// Press Order Button
              // SizedBox(
              //   width: double.infinity,
              //   height: 55,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: AppColors.primary,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(16),
              //       ),
              //     ),
              //     onPressed: () {
              //       if (nameCtrl.text.isEmpty ||
              //           emailCtrl.text.isEmpty ||
              //           phoneCtrl.text.isEmpty ||
              //           addressCtrl.text.isEmpty) {
              //         Get.snackbar("Error", "All fields are required");
              //         return;
              //       }

              //       controller.placeOrder(
              //         name: nameCtrl.text,
              //         email: emailCtrl.text,
              //         phone: phoneCtrl.text,
              //         address: addressCtrl.text,
              //       );
              //     },
              //     child: const Text(
              //       "Press Order",
              //       style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),
              /// Press Order Button
              Obx(() {
                final total = controller.totalAmount;

                return SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: total > 0
                          ? AppColors.primary
                          : AppColors.primary.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: total > 0
                        ? () {
                            if (nameCtrl.text.isEmpty ||
                                emailCtrl.text.isEmpty ||
                                phoneCtrl.text.isEmpty ||
                                addressCtrl.text.isEmpty) {
                              Get.snackbar("Error", "All fields are required");
                              return;
                            }

                            controller.placeOrder(
                              name: nameCtrl.text,
                              email: emailCtrl.text,
                              phone: phoneCtrl.text,
                              address: addressCtrl.text,
                            );
                          }
                        : null, // total 0 হলে button disabled
                    child: const Text(
                      "Press Order",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "My Cart",
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
              showCheckoutBottomSheet(context, controller);

              print("Add All To Cart clicked");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary, // change to AppColors.primary
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
            ),
            child: const Text(
              "Go to Checkout",
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            /// Total Amount
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Text(
                      "Total Amount:",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "\$${controller.totalAmount.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Divider(color: Colors.grey.withOpacity(0.4)),

            /// Cart List
            Expanded(
              child: Obx(
                () => ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    final isLast = index == controller.cartItems.length - 1;

                    return Column(
                      children: [
                        CartItemTile(
                          item: controller.cartItems[index],
                          controller: controller,
                        ),

                        /// Divider (last item এর নিচে থাকবে না)
                        if (!isLast)
                          Divider(
                            color: Colors.grey.withOpacity(0.3),
                            thickness: 1,
                            height: 24,
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
