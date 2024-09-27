import 'package:drinkdash/constants/strings.dart';
import 'package:drinkdash/constants/theme_data.dart';
import 'package:drinkdash/controller/cart_controller.dart';
import 'package:drinkdash/controller/homepage_controller.dart';
import 'package:drinkdash/widgets/c_appbar.dart';
import 'package:drinkdash/widgets/manage_item_qnty_Btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemReviewScreen extends StatelessWidget {
  ItemReviewScreen({super.key});
  final CartController cartController = Get.find();

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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            addeditemsCart(sW, sH),
            const SizedBox(
              height: 20,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Bill Details'),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          SizedBox(
                            width: sW * 0.5,
                            child: const Text("Item Total"),
                          ),
                          SizedBox(
                            width: sW * 0.3,
                            child: const Text("\$6,100"),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          SizedBox(
                            width: sW * 0.5,
                            child: const Text("One-day Permit Cost"),
                          ),
                          SizedBox(
                            width: sW * 0.3,
                            child: const Text("\$5"),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          SizedBox(
                            width: sW * 0.5,
                            child: const Text("Delivery fees"),
                          ),
                          SizedBox(
                            width: sW * 0.3,
                            child: const Text("\$60"),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          SizedBox(
                            width: sW * 0.5,
                            child: const Text("You Pay"),
                          ),
                          SizedBox(
                            width: sW * 0.3,
                            child: const Text("\$6,165"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Payment Method"),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Icon(Icons.done),
                          Text("Online UPI payment"),
                          // Text("(unavaible)")
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          // Icon(Icons.failed),
                          Text("Cash on Delivery"),
                          Text("(unavaible)")
                        ],
                      ),
                    ),
                    // Container(
                    //   margin: const EdgeInsets.symmetric(horizontal: 20),
                    //   width: sW * 0.8,
                    //   height: sH * 0.1,
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(10),
                    //       border: Border.all(color: AppTheme.lightGreyColor)),
                    //   child: TextFormField(
                    //     decoration:
                    //         const InputDecoration(border: InputBorder.none),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(child: Text("ADD ADDRESS")),
              height: 50,
            )
          ],
        ),
      ),
      backgroundColor: AppTheme.lightGreyColor,
    );
  }

  Widget addeditemsCart(
    double sW,
    double sH,
  ) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Items"),
          const Divider(
            color: AppTheme.lightGreyColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Image.asset(
                  "$imagepath/b1.jpg",
                  height: sH * 0.1,
                  width: sW * 0.1,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 15,
                ),
                const Column(
                  children: [
                    Text("Brand name"),
                    Text("data"),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                manageQuantityButtons(cartController),
                const Expanded(child: SizedBox()),
                const Text("\$60")
              ],
            ),
          )
        ],
      ),
    );
  }
}
