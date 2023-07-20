import 'package:get/get.dart';

class SplashController extends GetxController {
  RxDouble opacity = 0.0.obs;

  @override
  void onInit() {
    opacity.value = 1.0;
    super.onInit();
  }
}
