import 'package:get/get.dart';

class CartController extends GetxController {
  // Track whether the item is added to cart
  var isAddedToCart = false.obs;

  // Quantity of the item in the cart
  var quantity = 0.obs;
  // var showQnty = false.obs;

  // Method to toggle adding/removing item from the cart
  void toggleAddToCart() {
    isAddedToCart.value = !isAddedToCart.value;
    if (!isAddedToCart.value) {
      quantity.value = 1; // Reset quantity when item is removed
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
      // If quantity is 1 and the user tries to decrease, remove the item from cart
      toggleAddToCart();
      quantity.value = 0;
    }
  }
}
