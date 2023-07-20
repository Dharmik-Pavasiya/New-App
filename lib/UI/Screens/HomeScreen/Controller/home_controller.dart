import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/Infrastructure/Commons/Constants/route_constants.dart';

import '../../../../Infrastructure/Commons/Constants/api_constants.dart';
import '../../../../Infrastructure/Commons/Constants/color_constants.dart';
import '../../../../Infrastructure/Models/article_model.dart';
import '../../../../Infrastructure/Models/catergory_model.dart';
import '../../../../Infrastructure/Utils/helper.dart';

class HomeController extends GetxController {
  final Rx<Color> bgColor = ColorConstants.kWhite.obs;

  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  Rx<ArticleModel> articleModel = ArticleModel().obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Rx<TextEditingController> searchController = TextEditingController().obs;

  RxBool isLoading = false.obs;

  RxBool isSearchBar = false.obs;

  RxString searchText = "".obs;

  @override
  void onInit() {
    categories.value = getCategory();
    getArticle("");
    super.onInit();
  }

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(
            color: ColorConstants.kBlue, letterSpacing: 0.5, fontSize: 16.0),
        textAlign: TextAlign.center,
      ),
    );
  }

  Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          content: 'Sign Out',
        ),
      );
      Get.offAndToNamed(
        RouteConstants.loginScreen,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }

  Future<void> getArticle(String category) async {
    setLoading(true);
    String url =
        "${ApiConstants.BASE_URL}/everything?q=${category.isEmpty ? "business" : category}&apiKey=${ApiConstants.API_KEY}";

    print("Fired Url : $url");

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    print("Response : ${response.body}");

    if (jsonData["status"] == "ok") {
      articleModel.value = ArticleModel.fromJson(jsonData);
    }
    setLoading(false);
  }

  setLoading(bool value) {
    isLoading.value = value;
  }
}
