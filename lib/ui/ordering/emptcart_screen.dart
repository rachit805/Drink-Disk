import 'package:drinkdash/constants/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("$imagepath/emptycart.gif"),
          Text("Bro Cart is Empty!")
        ],
      ),
    );
  }
}
