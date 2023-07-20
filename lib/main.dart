import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Infrastructure/Commons/Constants/app_pages.dart';
import 'Infrastructure/Commons/Constants/color_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Poppins',
            ),
        primaryColor: ColorConstants.kWhite,
        appBarTheme: const AppBarTheme(
          color: ColorConstants.kWhite,
          elevation: 0.0,
        ),
      ),
      getPages: AppPages.routes,
    );
  }
}
