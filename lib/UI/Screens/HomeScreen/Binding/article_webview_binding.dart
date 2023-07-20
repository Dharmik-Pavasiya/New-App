import 'package:get/get.dart';

import '../Controller/article_webview_controller.dart';

class ArticleWebViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleWebViewController());
  }
}
