import 'package:get/get.dart';
import '../models/favorite_item.dart';

class FavoriteController extends GetxController {
  var favorites = <FavoriteItem>[].obs;

  bool isFavorite(int productId) {
    return favorites.any((item) => item.id == productId);
  }

  void toggleFavorite(FavoriteItem item) {
    if (isFavorite(item.id)) {
      favorites.removeWhere((element) => element.id == item.id);
      Get.snackbar("Removed", "${item.name} removed from favorites");
    } else {
      favorites.add(item);
      Get.snackbar("Added", "${item.name} added to favorites");
    }
  }
}
