import 'package:drinkdash/constants/theme_data.dart';
import 'package:drinkdash/ui/bottomNav/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:swipe_card/swipe_card.dart';
import 'package:swipe_cards/swipe_cards.dart'; // Import the package

class SwipeableCards extends StatefulWidget {
  @override
  _SwipeableCardsState createState() => _SwipeableCardsState();
}

class _SwipeableCardsState extends State<SwipeableCards> {
  List<String> imagePaths = [
    // Add your image paths here
    "assets/images/b1.jpg",
    "assets/images/b2.jpg",
    "assets/images/b3.jpg",
  ];

  List<String> labels = [
    "Item 1",
    "Item 2",
    "Item 3",
  ];

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;

    double sW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: sH * 0.6, // Height of the swipeable card area
          child: SwipeCards(
            matchEngine: MatchEngine(
              swipeItems: List.generate(imagePaths.length, (index) {
                return SwipeItem(
                    content:
                        _buildCardContent(index), // Build each card's content
                    likeAction: () {
                      // Get.to(() => const HomeScreen());
                    });
              }),
            ),
            onStackFinished: () {
              // Handle when the user swipes through all cards
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("No more items!"),
              ));
            },
            itemChanged: (SwipeItem item, int index) {
              // Handle item change when the user swipes
              print("Item changed: $index");
            },
            upSwipeAllowed: true, // Allow swipe up
            fillSpace: true,
            itemBuilder: (BuildContext context, int index) {
              return _buildCardContent(index);
            }, // Make cards fill the available space
          ),
        ),
      ),
    );
  }

  // Method to build each card's content
  Widget _buildCardContent(int index) {
    double sH = MediaQuery.of(context).size.height;

    double sW = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppTheme.primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.asset(
              imagePaths[index], // Dynamically load image
              height: sH * 0.45, // Adjust image height
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Center(
            child: Text(
              labels[index], // Dynamically load label
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
