import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Infrastructure/Commons/Constants/color_constants.dart';
import '../../../../Infrastructure/Commons/Constants/image_constants.dart';
import '../../../../Infrastructure/Commons/Constants/route_constants.dart';
import '../../../../Infrastructure/Dimension/spacing.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (auth.currentUser != null) {
          Get.offAndToNamed(RouteConstants.homeScreen);
        } else {
          Get.offAndToNamed(RouteConstants.loginScreen);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.kWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageConstants.newsAnimation),
            VSpace.spacing_standard,
            const Text(
              "News Journal",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
