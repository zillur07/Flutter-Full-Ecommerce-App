// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:nectar_app/src/controllers/auth_controller.dart';
// import 'package:nectar_app/src/utils/colors.dart';

// class AccountScreen extends StatelessWidget {
//   AccountScreen({super.key});
//   final AuthController authController = Get.put(AuthController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

//       floatingActionButton: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: SizedBox(
//           width: double.infinity,
//           height: 56,
//           child: ElevatedButton(
//             onPressed: () {
//               authController.logout();
//             },

//             style: ElevatedButton.styleFrom(
//               backgroundColor:
//                   AppColors.textFieldBg, // change to AppColors.primary
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               elevation: 1,
//             ),
//             child: Row(
//               children: [
//                 Icon(Icons.logout, color: AppColors.primary, size: 25),
//                 const SizedBox(width: 100),
//                 Text(
//                   "Log Out",
//                   style: TextStyle(
//                     fontSize: 17,
//                     fontWeight: FontWeight.w800,
//                     color: AppColors.primary,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//               /// 👤 Profile Row
//               Row(
//                 children: [
//                   /// Profile Image
//                   CircleAvatar(
//                     radius: 32,
//                     backgroundImage: AssetImage("assets/images/user.png"),
//                   ),

//                   const SizedBox(width: 14),

//                   /// Name + Email
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Obx(
//                               () => Text(
//                                 authController.userName.value.isEmpty
//                                     ? "Guest User"
//                                     : authController.userName.value,
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 6),
//                             Icon(
//                               Icons.edit,
//                               size: 20,
//                               color: AppColors.primary,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 4),
//                         Obx(
//                           () => Text(
//                             authController.userEmail.value.isEmpty
//                                 ? "guest@email.com"
//                                 : authController.userEmail.value,
//                             style: const TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 20),

//               Divider(color: Colors.grey.withOpacity(0.3)),

//               const SizedBox(height: 10),

//               /// 📦 Orders Row
//               InkWell(
//                 onTap: () {
//                   // TODO: Navigate to orders page
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   child: Row(
//                     children: [
//                       SvgPicture.asset("assets/svg/orders.svg", height: 22),
//                       const SizedBox(width: 14),
//                       const Expanded(
//                         child: Text(
//                           "Orders",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       const Icon(Icons.arrow_forward_ios, size: 16),
//                     ],
//                   ),
//                 ),
//               ),
//               Divider(color: Colors.grey.withOpacity(0.3)),

//               InkWell(
//                 onTap: () {
//                   // TODO: Navigate to orders page
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   child: Row(
//                     children: [
//                       SvgPicture.asset("assets/svg/details.svg", height: 22),
//                       const SizedBox(width: 14),
//                       const Expanded(
//                         child: Text(
//                           "My Details",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       const Icon(Icons.arrow_forward_ios, size: 16),
//                     ],
//                   ),
//                 ),
//               ),
//               Divider(color: Colors.grey.withOpacity(0.3)),
//               InkWell(
//                 onTap: () {
//                   // TODO: Navigate to orders page
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   child: Row(
//                     children: [
//                       SvgPicture.asset("assets/svg/address.svg", height: 22),
//                       const SizedBox(width: 14),
//                       const Expanded(
//                         child: Text(
//                           "Delivery Address",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       const Icon(Icons.arrow_forward_ios, size: 16),
//                     ],
//                   ),
//                 ),
//               ),
//               Divider(color: Colors.grey.withOpacity(0.3)),
//               InkWell(
//                 onTap: () {
//                   // TODO: Navigate to orders page
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   child: Row(
//                     children: [
//                       SvgPicture.asset("assets/svg/payment.svg", height: 22),
//                       const SizedBox(width: 14),
//                       const Expanded(
//                         child: Text(
//                           "Payment Methods",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       const Icon(Icons.arrow_forward_ios, size: 16),
//                     ],
//                   ),
//                 ),
//               ),
//               Divider(color: Colors.grey.withOpacity(0.3)),
//               InkWell(
//                 onTap: () {
//                   // TODO: Navigate to orders page
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   child: Row(
//                     children: [
//                       SvgPicture.asset("assets/svg/promo_code.svg", height: 22),
//                       const SizedBox(width: 14),
//                       const Expanded(
//                         child: Text(
//                           "Promo Cord",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       const Icon(Icons.arrow_forward_ios, size: 16),
//                     ],
//                   ),
//                 ),
//               ),
//               Divider(color: Colors.grey.withOpacity(0.3)),
//               InkWell(
//                 onTap: () {
//                   // TODO: Navigate to orders page
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   child: Row(
//                     children: [
//                       SvgPicture.asset(
//                         "assets/svg/notifications.svg",
//                         height: 22,
//                       ),
//                       const SizedBox(width: 14),
//                       const Expanded(
//                         child: Text(
//                           "Notifications",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       const Icon(Icons.arrow_forward_ios, size: 16),
//                     ],
//                   ),
//                 ),
//               ),
//               Divider(color: Colors.grey.withOpacity(0.3)),
//               InkWell(
//                 onTap: () {
//                   // TODO: Navigate to orders page
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   child: Row(
//                     children: [
//                       SvgPicture.asset("assets/svg/help.svg", height: 22),
//                       const SizedBox(width: 14),
//                       const Expanded(
//                         child: Text(
//                           "Help",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       const Icon(Icons.arrow_forward_ios, size: 16),
//                     ],
//                   ),
//                 ),
//               ),
//               Divider(color: Colors.grey.withOpacity(0.3)),
//               InkWell(
//                 onTap: () {
//                   // TODO: Navigate to orders page
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   child: Row(
//                     children: [
//                       SvgPicture.asset("assets/svg/about.svg", height: 22),
//                       const SizedBox(width: 14),
//                       const Expanded(
//                         child: Text(
//                           "About",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       const Icon(Icons.arrow_forward_ios, size: 16),
//                     ],
//                   ),
//                 ),
//               ),
//               Divider(color: Colors.grey.withOpacity(0.3)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nectar_app/src/pages/welcome_screen.dart';
import 'package:nectar_app/src/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String name = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  /// 🔹 Load user from SharedPreferences
  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();

    final userJson = prefs.getString('user');
    if (userJson != null) {
      final user = jsonDecode(userJson);
      setState(() {
        name = user['full_name'] ?? '';
        email = user['email'] ?? '';
      });
    }
  }

  /// 🔹 Logout
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Get.offAll(() => WelcomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// 🔴 Logout Button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: logout,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.textFieldBg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.logout, color: AppColors.primary),
                SizedBox(width: 10),
                Text(
                  "Log Out",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// 👤 Profile Section
              Row(
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage("assets/images/user.png"),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name.isEmpty ? "User" : name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          email.isEmpty ? "" : email,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Divider(color: Colors.grey.withOpacity(0.3)),

              /// 🔹 Menu Items
              menuItem("assets/svg/orders.svg", "Orders"),
              menuItem("assets/svg/details.svg", "My Details"),
              menuItem("assets/svg/address.svg", "Delivery Address"),
              menuItem("assets/svg/payment.svg", "Payment Methods"),
              menuItem("assets/svg/promo_code.svg", "Promo Code"),
              menuItem("assets/svg/notifications.svg", "Notifications"),
              menuItem("assets/svg/help.svg", "Help"),
              menuItem("assets/svg/about.svg", "About"),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Menu Item Widget
  Widget menuItem(String icon, String title) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Row(
              children: [
                SvgPicture.asset(icon, height: 22),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
          ),
        ),
        Divider(color: Colors.grey.withOpacity(0.3)),
      ],
    );
  }
}
