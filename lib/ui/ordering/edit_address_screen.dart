import 'package:drinkdash/constants/theme_data.dart';
import 'package:drinkdash/controller/homepage_controller.dart';
import 'package:drinkdash/widgets/c_appbar.dart';
import 'package:drinkdash/widgets/c_button.dart';
import 'package:drinkdash/widgets/c_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAddressScreen extends StatelessWidget {
  EditAddressScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController flatnoController = TextEditingController();
  final TextEditingController colonyController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
// final TextEditingController nameController = TextEditingController();
  final BottomNavController _bottomNavController = Get.find();
  @override
  Widget build(BuildContext context) {
    double sW = MediaQuery.of(context).size.width;
    double sH = MediaQuery.of(context).size.height;
    return SafeArea(
        child: InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppTheme.lightGreyColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Obx(() {
            return CustomAppBar(
              showBackIcon: _bottomNavController.currentIndex.value != 0,
            );
          }),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Edit Address",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: sW,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      labelText("FULL NAME"),
                      CTextformfield(
                        hintname: 'Full Name',
                        controller: nameController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      labelText("YOUR MOBILE NO."),
                      CTextformfield(
                        hintname: 'Enter your 10-digit mobile number',
                        controller: phoneController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      labelText("YOUR EMAIL"),
                      CTextformfield(
                        hintname: 'Enter your email address',
                        controller: emailController,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "ADDRESS",
                          style: TextStyle(fontSize: 20, color: Colors.black87),
                        ),
                      ),
                      labelText("YOUR AREA PIN"),
                      CTextformfield(
                        hintname: 'Select a Pincode',
                        controller: pincodeController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      labelText("FLAT/HOUSE NO. AND BUILDING NAME"),
                      CTextformfield(
                        hintname: 'Flat, House no., Building, etc.',
                        controller: flatnoController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      labelText("STREET, COLONY, LANDMARK"),
                      CTextformfield(
                        hintname: 'Colony name, Landmark, etc.',
                        controller: colonyController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      labelText("SELECT A CITY"),
                      CTextformfield(
                        hintname: 'Select a City',
                        controller: cityController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      labelText("SELECT A STATE"),
                      CTextformfield(
                        hintname: "State",
                        controller: stateController,
                        // keyboardType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      cbutton("SAVE & CONTINUE")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget labelText(String label) {
    return Text(
      label,
      style:
          TextStyle(fontSize: 13, color: AppTheme.primaryColor.withOpacity(1)),
    );
  }
}
