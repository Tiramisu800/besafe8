import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:besafe/controller/auth_controller.dart';
import 'package:besafe/views/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    var localizedStrings = AppLocalizations.of(context);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            greenIntroWidget(),

            const SizedBox(height: 50,),

            DecisionButton(
              'assets/driver.png',
              localizedStrings!.logasd,
                (){
                authController.isLoginAsDriver = true;
                  Get.to(()=> const LoginScreen());
                },
              Get.width*0.8
            ),

            const SizedBox(height: 20,),
            DecisionButton(
                'assets/customer.png',
                localizedStrings.logasu,
                    (){
                      authController.isLoginAsDriver = false;
                   Get.to(()=> const LoginScreen());



                    },
                Get.width*0.8
            ),
          ],
        ),
      ),
    );
  }
}
