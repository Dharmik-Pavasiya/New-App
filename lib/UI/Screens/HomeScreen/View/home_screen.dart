import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/UI/Screens/HomeScreen/Widgets/news_card.dart';

import '../../../../Infrastructure/Commons/Constants/color_constants.dart';
import '../../../../Infrastructure/Dimension/spacing.dart';
import '../Controller/home_controller.dart';
import '../Widgets/category_card.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: controller.bgColor.value,
        appBar: AppBar(
          centerTitle: true,
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
        body: controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    height: 70.0,
                    child: Center(
                      child: ListView.builder(
                        itemCount: controller.categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.getArticle(controller.categories[index].categoryName!);
                            },
                            child: CategoryCard(
                              imageUrl: controller.categories[index].imageUrl!,
                              categoryName:
                                  controller.categories[index].categoryName!,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  VSpace.spacing_standard,
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListView.builder(
                        itemCount:
                            controller.articleModel.value.articles!.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          print(
                              "Total Length : ${controller.articleModel.value.articles!.length}");

                          return NewsCard(
                            imageUrl:
                                "${controller.articleModel.value.articles![index].urlToImage}",
                            title:
                                "${controller.articleModel.value.articles![index].title}",
                            description:
                                "${controller.articleModel.value.articles![index].description}",
                            url:
                                "${controller.articleModel.value.articles![index].url}",
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
