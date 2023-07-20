import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Infrastructure/Commons/Constants/color_constants.dart';
import '../Controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News ",
              style: TextStyle(
                color: ColorConstants.kBlack,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Journal",
              style: TextStyle(
                color: ColorConstants.kBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: Column(),
    );
  }
}
