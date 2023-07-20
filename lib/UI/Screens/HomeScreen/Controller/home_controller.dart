import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../Infrastructure/Commons/Constants/api_constants.dart';
import '../../../../Infrastructure/Commons/Constants/color_constants.dart';
import '../../../../Infrastructure/Models/article_model.dart';
import '../../../../Infrastructure/Models/catergory_model.dart';
import '../../../../Infrastructure/Utils/helper.dart';

class HomeController extends GetxController {
  final Rx<Color> bgColor = ColorConstants.kWhite.obs;

  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  Rx<ArticleModel> articleModel = ArticleModel().obs;

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
