import 'package:get/get.dart';

class NewArrivalController extends GetxController {
  var selectedQnty = 0.obs;

  // Function to update the selected index
  void updateSelectedQnty(int index) {
    selectedQnty.value = index;
  }
}
