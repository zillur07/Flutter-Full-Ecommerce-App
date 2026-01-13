import 'package:get/get.dart';

class CartItem {
  final String image;
  final String name;
  final double price;
  RxInt quantity = 1.obs;

  CartItem({required this.image, required this.name, required this.price});
}

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  @override
  void onInit() {
    super.onInit();

    // 🔹 Temporary dummy data
    cartItems.addAll([
      CartItem(image: 'assets/images/product1.png', name: 'Egg', price: 4.5),
      CartItem(image: 'assets/images/product5.png', name: 'Drink', price: 2.0),
      CartItem(image: 'assets/images/product3.png', name: 'Apple', price: 2.0),
    ]);
  }

  double get totalAmount =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.quantity.value);

  void increaseQty(CartItem item) {
    item.quantity.value++;
  }

  void decreaseQty(CartItem item) {
    if (item.quantity.value > 1) {
      item.quantity.value--;
    }
  }

  void removeItem(CartItem item) {
    cartItems.remove(item);
  }
}
