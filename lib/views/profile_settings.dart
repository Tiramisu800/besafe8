import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:besafe/controller/auth_controller.dart';
import 'package:besafe/utils/app_colors.dart';
import 'package:besafe/widgets/green_intro_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController homeController = TextEditingController();
  TextEditingController businessController = TextEditingController();
  TextEditingController shopController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthController authController = Get.find<AuthController>();

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  late LatLng homeAddress;
  late LatLng businessAddress;
  late LatLng shoppingAddress;
  getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      selectedImage = File(image.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var localizedStrings = AppLocalizations.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.4,
              child: Stack(
                children: [
                  greenIntroWidgetWithoutLogos(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {
                        getImage(ImageSource.camera);
                      },
                      child: selectedImage == null
                          ? Container(
                              width: 120,
                              height: 120,
                              margin: EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).appBarTheme.backgroundColor),
                              child: Center(
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 40,
                                  color: Theme.of(context).colorScheme.background,
                                ),
                              ),
                            )
                          : Container(
                              width: 120,
                              height: 120,
                              margin: EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(selectedImage!),
                                      fit: BoxFit.fill),
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).colorScheme.background),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFieldWidget(
                        localizedStrings!.name, Icons.person_outlined, nameController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return localizedStrings!.nameisreg;
                      }

                      if (input.length < 5) {
                        return localizedStrings!.nameval;
                      }

                      return null;
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                        localizedStrings!.home, Icons.home_outlined, homeController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return localizedStrings!.homeisreg;
                      }

                      return null;
                    }, onTap: () async {
                      Prediction? p =
                          await authController.showGoogleAutoComplete(context);

                      /// now let's translate this selected address and convert it to latlng obj

                      homeAddress = await authController
                          .buildLatLngFromAddress(p!.description!);
                      homeController.text = p.description!;

                      ///store this information into firebase together once update is clicked
                    }, readOnly: true),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(localizedStrings!.businnesadd, Icons.card_travel,
                        businessController, (String? input) {
                      if (input!.isEmpty) {
                        return localizedStrings!.businnesaddisreg;
                      }

                      return null;
                    }, onTap: () async {
                      Prediction? p =
                          await authController.showGoogleAutoComplete(context);

                      /// now let's translate this selected address and convert it to latlng obj

                      businessAddress = await authController
                          .buildLatLngFromAddress(p!.description!);
                      businessController.text = p.description!;

                      ///store this information into firebase together once update is clicked
                    }, readOnly: true),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                        localizedStrings!.shop,
                        Icons.shopping_cart_outlined,
                        shopController, (String? input) {
                      if (input!.isEmpty) {
                        return localizedStrings!.shopisreg;
                      }

                      return null;
                    }, onTap: () async {
                      Prediction? p =
                          await authController.showGoogleAutoComplete(context);

                      /// now let's translate this selected address and convert it to latlng obj

                      shoppingAddress = await authController
                          .buildLatLngFromAddress(p!.description!);
                      shopController.text = p.description!;

                      ///store this information into firebase together once update is clicked
                    }, readOnly: true),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(() => authController.isProfileUploading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : greenButton(localizedStrings!.submit, () {
                            if (!formKey.currentState!.validate()) {
                              return;
                            }

                            if (selectedImage == null) {
                              Get.snackbar('Warning', localizedStrings!.plsaddim);
                              return;
                            }
                            authController.isProfileUploading(true);
                            authController.storeUserInfo(
                                selectedImage!,
                                nameController.text,
                                homeController.text,
                                businessController.text,
                                shopController.text,
                                businessLatLng: businessAddress,
                                homeLatLng: homeAddress,
                                shoppingLatLng: shoppingAddress);
                          })),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFieldWidget(String title, IconData iconData,
      TextEditingController controller, Function validator,
      {Function? onTap, bool readOnly = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          width: Get.width,
          // height: 50,
          decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 1)
              ],
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            readOnly: readOnly,
            onTap: () => onTap!(),
            validator: (input) => validator(input),
            controller: controller,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  iconData,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }

  Widget greenButton(String title, Function onPressed) {
    return MaterialButton(
      minWidth: Get.width,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: Theme.of(context).colorScheme.secondary,
      onPressed: () => onPressed(),
      child: Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
