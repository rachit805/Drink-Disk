import 'package:drinkdash/constants/strings.dart';
import 'package:drinkdash/constants/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class CBanner extends StatelessWidget {
  const CBanner({
    super.key,
  });

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      // print('Could not launch $phoneUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppTheme.secondaryColor),
      height: 40,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: GestureDetector(
            onTap: () {
              _makePhoneCall(banneno); // Call the method when the user taps
            },
            child: Text(
              "$bannertext$banneno", // Display the banner text with the phone number
              textAlign: TextAlign.center,
              style: AppTheme.textTheme.bodyMedium?.copyWith(
                decoration: TextDecoration
                    .underline, // Optional: Add underline to indicate it's clickable
              ),
            ),
          ),
        ),
      ),
    );
  }
}
