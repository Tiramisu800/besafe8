import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:besafe/controller/auth_controller.dart';
import 'package:besafe/views/driver/car_registration/car_registration_template.dart';
import 'package:besafe/views/login_screen.dart';

 import '../../widgets/green_intro_widget.dart';
import '../../widgets/my_button.dart';
import '../driver/profile_setup.dart';

class DecisionScreen extends StatefulWidget {
    DecisionScreen({Key? key}) : super(key: key);

  @override
  State<DecisionScreen> createState() => _DecisionScreenState();
}

class _DecisionScreenState extends State<DecisionScreen> {
    AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            greenIntroWidget(),

            const SizedBox(height: 50,),

            DecisionButton(
              'assets/driver.png',
              'Login As Driver',
                (){
                authController.isLoginAsDriver = true;
                  Get.to(()=> LoginScreen());
                },
              Get.width*0.8
            ),

            const SizedBox(height: 20,),
            DecisionButton(
                'assets/customer.png',
                'Login As User',
                    (){
                      authController.isLoginAsDriver = false;
                   Get.to(()=> LoginScreen());



                    },
                Get.width*0.8
            ),
          ],
        ),
      ),
    );
  }
}
