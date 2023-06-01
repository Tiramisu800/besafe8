import 'package:besafe/screens/auth/google_page.dart';
import 'package:besafe/screens/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:besafe/controller/auth_controller.dart';
import 'package:besafe/views/login_screen.dart';
import 'package:besafe/screens/auth/facebook_page.dart';
import '../../widgets/green_intro_widget.dart';
import '../../widgets/my_button.dart';

class DecisionScreen extends StatefulWidget {
  const DecisionScreen({Key? key}) : super(key: key);

  @override
  State<DecisionScreen> createState() => _DecisionScreenState();
}

class _DecisionScreenState extends State<DecisionScreen> {
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            greenIntroWidget(),
            const SizedBox(
              height: 50,
            ),
            DecisionButton('assets/driver.png', 'Login As Driver', () {
              authController.isLoginAsDriver = true;
              Get.to(() => const LoginScreen());
            }, Get.width * 0.8),
            const SizedBox(
              height: 20,
            ),
            DecisionButton('assets/customer.png', 'Login As User', () {
              authController.isLoginAsDriver = false;
              Get.to(() => const LoginScreen());
            }, Get.width * 0.8),
            const SizedBox(
              height: 20,
            ),
            DecisionButton('assets/customer.png', 'Sign up by Email', () {
              authController.isLoginAsDriver = false;
              Get.to(() => const RegisterPage());
            }, Get.width * 0.8),
            DecisionButton('assets/customer.png', 'Sign up by Gmail', () {
              authController.isLoginAsDriver = false;
              // Get.to(() => FacebookLoginPage());
            }, Get.width * 0.8),
          ],
        ),
      ),
    );
  }
}
