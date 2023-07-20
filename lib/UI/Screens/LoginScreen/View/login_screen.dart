import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:newsapp/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:newsapp/Infrastructure/Dimension/spacing.dart';
import 'package:newsapp/UI/Screens/LoginScreen/Controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          backgroundColor: ColorConstants.kWhite,
          body: Stack(
            children: [
              Column(
                children: [
                  Image.asset(ImageConstants.signup),
                  VSpace.spacing_xx_small,
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Login to News ',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'Journal',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: ColorConstants.kBlue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  VSpace.spacing_large,
                  InkWell(
                    onTap: () {
                      controller.signInWithGoogle(context: context);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 60.0),
                      decoration: BoxDecoration(
                        color: ColorConstants.kWhite,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1,
                            blurRadius: 2,
                          )
                        ],
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageConstants.google,
                            height: 48.0,
                          ),
                          const Text(
                            "Sign In With Google",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  VSpace.spacing_standard,
                ],
              ),
              if (controller.isLoading.value)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        );
      },
    );
  }
}
