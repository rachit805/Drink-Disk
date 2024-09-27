import 'package:drinkdash/constants/theme_data.dart';
import 'package:drinkdash/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget manageQuantityButtons(CartController cartController) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    height: 30,
    width: 120,
    child: Row(
      children: [
        GestureDetector(
          onTap: () {
            cartController.decreaseQuantity(); // Decrease quantity
          },
          child: Container(
            width: 30,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(color: AppTheme.primaryColor),
            child: const Icon(
              Icons.remove,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          decoration:
              BoxDecoration(border: Border.all(color: AppTheme.lightGreyColor)),
          width: 50,
          padding: const EdgeInsets.all(5),
          child: Center(
            child: Obx(() => Text(
                "${cartController.quantity.value}")), // Display current quantity
          ),
        ),
        GestureDetector(
          onTap: () {
            cartController.increaseQuantity(); // Increase quantity
          },
          child: Container(
            width: 30,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(color: AppTheme.primaryColor),
            child: const Icon(
              Icons.add,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
