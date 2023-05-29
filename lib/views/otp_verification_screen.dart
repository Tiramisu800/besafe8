import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:besafe/controller/auth_controller.dart';
import 'package:besafe/utils/app_colors.dart';
import 'package:besafe/widgets/green_intro_widget.dart';
import '../widgets/otp_verification_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  const OtpVerificationScreen(this.phoneNumber, {Key? key}) : super(key: key);

  @override
  OtpVerificationScreenState createState() => OtpVerificationScreenState();
}

class OtpVerificationScreenState extends State<OtpVerificationScreen> {
  late AuthController authController;

  @override
  void initState() {
    super.initState();
    authController = Get.put(AuthController()); // Initialize the authController
    authController.phoneAuth(widget.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                greenIntroWidget(),
                Positioned(
                  top: 60,
                  left: 30,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.greenColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            otpVerificationWidget(),
          ],
        ),
      ),
    );
  }
}
