import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nectar_app/src/pages/welcome_screen.dart';

class AuthController extends GetxController {
  final box = GetStorage();

  var userName = ''.obs;
  var userEmail = ''.obs;
  var isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  void loadUser() {
    userName.value = box.read('name') ?? '';
    userEmail.value = box.read('email') ?? '';
    isLoggedIn.value = box.read('isLoggedIn') ?? false;
  }

  void logout() {
    box.erase(); // সব data clear
    isLoggedIn.value = false;

    Get.offAll(() => WelcomeScreen());
  }
}
