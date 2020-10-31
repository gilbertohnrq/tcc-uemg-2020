import 'package:ezj_app/src/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'package:ezj_app/src/helpers/app_config.dart' as config;
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ez Jobs',
      theme: ThemeData(
        scaffoldBackgroundColor: config.Colors().backgroundColor(),
        fontFamily: 'Varela Round',
      ),
      home: LoginPage(),
    );
  }
}
