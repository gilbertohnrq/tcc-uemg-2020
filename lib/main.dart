import 'package:ezj_app/src/bindings/app_binding.dart';
import 'package:ezj_app/src/pages/login_page.dart';
import 'package:ezj_app/src/controllers/firebase_controller.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:ezj_app/src/utils/app_config.dart' as config;
import 'package:get/get.dart';

import 'src/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Ez Jobs',
      theme: ThemeData(
        scaffoldBackgroundColor: config.Colors().backgroundColor(),
        fontFamily: 'Varela Round',
      ),
      home: HomePage(),
    );
  }
}
