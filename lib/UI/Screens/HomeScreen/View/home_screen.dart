import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/Infrastructure/Commons/Constants/image_constants.dart';
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
        key: controller.scaffoldKey,
        backgroundColor: controller.bgColor.value,
        drawer: Drawer(
          backgroundColor: ColorConstants.kWhite,
          child: Column(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: ColorConstants.kWhite,
                ),
                curve: Curves.bounceInOut,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: CircleAvatar(
                        radius: 48.0,
                        child: CachedNetworkImage(
                          imageUrl: "${controller.auth.currentUser!.photoURL}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    VSpace.spacing_tiny,
                    Text(
                      "${controller.auth.currentUser!.displayName}",
                      style: const TextStyle(
                        color: ColorConstants.kBlack,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
              ListTile(
                onTap: () {
                  controller.signOut(context: context);
                },
                leading: const Icon(
                  Icons.exit_to_app,
                  color: ColorConstants.kBlack,
                ),
                title: const Text(
                  "Logout",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              controller.scaffoldKey.currentState?.openDrawer();
            },
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                ImageConstants.drawer,
                color: ColorConstants.kBlack,
                height: 24.0,
              ),
            ),
          ),
          centerTitle: true,
          title: controller.isSearchBar.value
              ? TextField(
                  onChanged: (value) {
                    controller.searchText.value = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Search by word",
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.isSearchBar.value = false;

                        print("Text : ${controller.searchText.value}");

                        controller.getArticle(controller.searchText.value);
                      },
                      icon: const Icon(
                        Icons.search,
                        color: ColorConstants.kBlue,
                      ),
                    ),
                  ),
                )
              : const Text.rich(
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
        floatingActionButton: controller.isSearchBar.value
            ? Container()
            : FloatingActionButton(
                backgroundColor: ColorConstants.kBlack,
                child: const Icon(
                  Icons.search,
                  color: ColorConstants.kBlue,
                ),
                onPressed: () {
                  controller.isSearchBar.value = true;
                },
              ),
        body: controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  VSpace.spacing_micro,
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
                              controller.getArticle(
                                  controller.categories[index].categoryName!);
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
                        physics: const BouncingScrollPhysics(),
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
