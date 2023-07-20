import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebViewController extends GetxController {
  final RxString url = "".obs;
  final Rx<WebViewController> webController = WebViewController().obs;

  RxInt loadingPercentage = 0.obs;

  @override
  void onInit() {
    url.value = Get.arguments;

    webController.value.loadRequest(
      Uri.parse(url.value),
    );

    webController.value.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (progress) {
          loadingPercentage.value = progress;
        },
        onPageStarted: (url) {
          loadingPercentage.value = 0;
        },
        onPageFinished: (url) {
          loadingPercentage.value = 100;
        },
      ),
    );

    super.onInit();
  }
}
