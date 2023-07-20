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
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offAllNamed(RouteConstants.homeScreen);
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
