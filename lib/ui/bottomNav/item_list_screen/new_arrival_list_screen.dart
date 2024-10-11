import 'package:drinkdash/constants/strings.dart';
import 'package:drinkdash/constants/theme_data.dart';
import 'package:drinkdash/controller/cart_controller.dart';
import 'package:drinkdash/controller/homepage_controller.dart';
import 'package:drinkdash/controller/new_arrival_controller.dart';
import 'package:drinkdash/data/wines_data.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Obx(() {
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
              ////
              Expanded(
                child: ListView.builder(
                    itemCount: winesData.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, i) {
                      final data = winesData[i];

                      return Card(
                        // margin: EdgeInsets.only(bottom: 5),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 10,
                                top: 10,
                                bottom: 10,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(data.imageUrl,
                                      width: 50,
                                      height: 100,
                                      fit: BoxFit.cover),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    // Wrap the Column in an Expanded widget to make it take full width
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(data.name),
                                        Text(
                                            '₹${data.price.toString()}') // Show price with 2 decimal places
                                        ,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween, // This will now work
                                          children: [
                                            Text(
                                                "${data.quantity.toString()}ML"),
                                            // Spacer widget can be used if needed to add space between the widgets
                                            Obx(() {
                                              return cartController
                                                      .isAddedToCart.value
                                                  ? manageQuantityButtons(
                                                      cartController) // Show quantity management buttons if added to cart
                                                  : addToCartButton(
                                                      data.name,
                                                      data.imageUrl,
                                                      data.price,
                                                      data.quantity); // Show "Add to Cart" button otherwise
                                            }),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // const Divider(),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                border: const Border(
                                  top: BorderSide(
                                      color: Colors.black26, width: 0.1),
                                ),
                              ),
                              height: 70,
                              child: mlContainer(context),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
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

  Widget addToCartButton(
    String name,
    String imageUrl,
    double price,
    int quantity,
  ) {
    return GestureDetector(
      onTap: () {
        cartController.toggleAddToCart(
            name, imageUrl, price, quantity); // Add to cart action
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Text(
          "ADD TO CART",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // Method to create the quantity management buttons
}
