import 'package:get/get.dart';

class CartController extends GetxController {
  var isAddedToCart = false.obs;
  var quantity = 0.obs;

  RxList cartlist = [].obs;

// Method to toggle adding/removing item from the cart
  void toggleAddToCart(String name, String thumb, double price, int qnty) {
    // Find if the item already exists in the cart
    var existingItemIndex = cartlist.indexWhere((item) => item.name == name);

    // If the item is not added yet
    if (existingItemIndex == -1) {
      // Add the item to the cart with the default quantity
      cartlist.add({
        'name': name,
        'thumb': thumb,
        'price': price,
        'qnty': qnty,
      });
      isAddedToCart.value = true;
      quantity.value = 1;
    } else {
      // If the item is already in the cart, toggle removal
      cartlist.removeAt(existingItemIndex);
      isAddedToCart.value = false;
      quantity.value = 1; // Reset the quantity
    }
  }

  // Method to increase quantity
  void increaseQuantity() {
    quantity.value++;
  }

  // Method to decrease quantity
  void decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value--;
    } else {
      // toggleAddToCart();
      quantity.value = 0;
    }
  }
}
