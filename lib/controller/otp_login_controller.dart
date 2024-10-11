import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OTPLogInController extends GetxController {
  var isOTPSent = false.obs;
  var phoneNumber = ''.obs;
  var otp = ''.obs;
  FirebaseAuth auth = FirebaseAuth.instance;

  // To send OTP
  Future<void> sendOTP() async {
    await auth.verifyPhoneNumber(
      phoneNumber: '+91${phoneNumber.value}', // Add country code
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar("Error", "Failed to send OTP: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        isOTPSent.value = true; // Update to show OTP field
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  // To verify OTP and sign in
  Future<void> verifyOTP() async {
    // Add verification logic here, e.g., using the PhoneAuthCredential.
  }
}
