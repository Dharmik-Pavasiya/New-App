import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/UI/Screens/HomeScreen/Controller/article_webview_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../Infrastructure/Commons/Constants/color_constants.dart';

class ArticleWebView extends GetView<ArticleWebViewController> {
  const ArticleWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: ColorConstants.kBlack,
          ),
        ),
        title: const Text.rich(
          TextSpan(children: [
            TextSpan(
              text: "News ",
              style: TextStyle(
                color: ColorConstants.kBlack,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: "Journal",
              style: TextStyle(
                color: ColorConstants.kBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ]),
        ),
      ),
      body: Obx(() {
        return Container(
          child: Stack(
            children: [
              WebViewWidget(
                controller: controller.webController.value,
              ),
              if (controller.loadingPercentage.value < 100)
                Container(
                  color: ColorConstants.kWhite,
                  padding: const EdgeInsets.all(50.0),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          ),
        );
      }),
    );
  }
}
