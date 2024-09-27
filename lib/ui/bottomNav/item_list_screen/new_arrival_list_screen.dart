import 'package:drinkdash/constants/strings.dart';
import 'package:drinkdash/constants/theme_data.dart';
import 'package:drinkdash/controller/cart_controller.dart';
import 'package:drinkdash/controller/homepage_controller.dart';
import 'package:drinkdash/controller/new_arrival_controller.dart';
import 'package:drinkdash/widgets/c_appbar.dart';
import 'package:drinkdash/widgets/manage_item_qnty_Btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewArrivalListScreen extends StatelessWidget {
  NewArrivalListScreen({super.key});
  List ml = ["250ML", "500ML", "750ML", "1000ML"];
  final NewArrivalController controller = Get.put(NewArrivalController());
  final CartController cartController = Get.put(CartController());
  final BottomNavController _bottomNavController = Get.find();
  @override
  Widget build(BuildContext context) {
    double sW = MediaQuery.of(context).size.width;
    double sH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Obx(() {
          // Pass showBackIcon as true when currentIndex > 0 (for tabs 2, 3, 4)
          return CustomAppBar(
            showBackIcon: _bottomNavController.currentIndex.value != 0,
          );
        }),
      ),
      backgroundColor: AppTheme.lightGreyColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 50,
              width: sW,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                      child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("Showing 10 products"),
                  )),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 10, top: 10, bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisSize: MainAxisSize
                      //     .max, // Shrink the Row to fit its children
                      children: [
                        Image.asset(
                          "$imagepath/b1.jpg",
                          height: sH * 0.12,
                          width: sW * 0.15,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align texts to the start
                          children: [
                            const Text("JAKOB STEINER LIQUEUR"),
                            const Text("\$20.00"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("750ML"),
                                // SizedBox(
                                //     width: sW *
                                //         0.23), // Adds a fixed amount of space
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Obx(() {
                                    return cartController.isAddedToCart.value
                                        ? manageQuantityButtons(
                                            cartController) // Show quantity management buttons if added to cart
                                        : addToCartButton(); // Show "Add to Cart" button otherwise
                                  }),
                                ),
                                // addtocartBtn(),
                                // Align(
                                //   alignment: Alignment.centerRight,
                                //   child: Container(
                                //     padding: const EdgeInsets.all(10),
                                //     decoration: BoxDecoration(
                                //       color: AppTheme.primaryColor,
                                //       borderRadius: BorderRadius.circular(5),
                                //     ),
                                //     child: const Text("ADD TO CART"),
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // const Divider(),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        border: const Border(
                          top: BorderSide(color: Colors.black26, width: 0.1),
                        ),
                      ),
                      height: 70,
                      child: mlContainer(context))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget mlContainer(BuildContext context) {
    double sW = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Center(
        child: Wrap(
          spacing: sW * 0.01, // Space between containers horizontally
          runSpacing: 20, // Space between containers vertically
          children: List.generate(ml.length, (index) {
            return GestureDetector(
              onTap: () {
                // Update selected container
                controller.updateSelectedQnty(index);
                // Print selected value in console
                print('Selected: ${ml[index]}');
              },
              child: Obx(() => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 40,
                    width: 100, // Adjust width to fit two in a row
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: controller.selectedQnty.value == index
                          ? AppTheme.primaryColor // Selected color
                          : Colors.transparent, // Non-selected containers
                      border: Border.all(
                        color: Colors
                            .black, // Border color for non-selected containers
                        width: 1.0,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        ml[index], // Dynamically load label
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: controller.selectedQnty.value == index
                              ? Colors.white
                              : AppTheme
                                  .primaryColor, // Change text color for selected and non-selected
                        ),
                      ),
                    ),
                  )),
            );
          }),
        ),
      ),
    );
  }

  Widget addToCartButton() {
    return GestureDetector(
      onTap: () {
        cartController.toggleAddToCart(); // Add to cart action
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Text("ADD TO CART"),
      ),
    );
  }

  // Method to create the quantity management buttons
}
