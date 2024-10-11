import 'package:drinkdash/controller/otp_login_controller.dart';
import 'package:drinkdash/widgets/c_button.dart';
import 'package:drinkdash/widgets/c_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogInScreen extends StatelessWidget {
  final OTPLogInController otpController = Get.put(OTPLogInController());
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpControllerField = TextEditingController();

  LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("WELCOME"),
            const SizedBox(height: 10),
            const Text("Login for a seamless experience"),
            const SizedBox(height: 50),
            // Phone Number Input
            CTextformfield(
              hintname: 'Enter your 10-digit mobile no.',
              controller: phoneController,
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                otpController.phoneNumber.value = value;
              },
            ),
            const SizedBox(height: 20),

            // OTP Input - Only visible when OTP is sent
            Obx(() {
              return otpController.isOTPSent.value
                  ? Column(
                      children: [
                        const Text("OTP"),
                        CTextformfield(
                          hintname: 'Enter the OTP received',
                          controller: otpControllerField,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            otpController.otp.value = value;
                          },
                        ),
                        const InkWell(child: Text("Resend OTP")),
                        const SizedBox(height: 20),
                      ],
                    )
                  : const SizedBox.shrink(); // Hide OTP section when not needed
            }),

            // Send OTP / Proceed Button
            Obx(() {
              return InkWell(
                onTap: () {
                  if (otpController.isOTPSent.value) {
                    // Verify OTP
                    otpController.verifyOTP();
                  } else if (phoneController.text.length == 10) {
                    // Send OTP if phone number is valid
                    otpController.sendOTP();
                  } else {
                    Get.snackbar("Invalid Number",
                        "Please enter a valid 10-digit phone number.");
                  }
                },
                child: cbutton(
                  otpController.isOTPSent.value ? "Proceed" : "Send OTP",
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
