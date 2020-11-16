import 'package:ezj_app/src/controllers/firebase_controller.dart';
import 'package:ezj_app/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SplashScreen(
          seconds: 5,
          gradientBackground: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue[300], Colors.purple[400]]),
          navigateAfterSeconds: FirebaseController.to.getCurrentUser() == null
              ? Routes.LOGIN
              : Routes.HOME,
          loaderColor: Colors.red,
        ),
        Container(
          margin: EdgeInsets.all(140.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
