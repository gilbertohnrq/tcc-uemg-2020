import 'package:ezj_app/src/controllers/login_controller.dart';
import 'package:ezj_app/src/pages/home_page.dart';
import 'package:ezj_app/src/pages/signup_page.dart';
import 'package:ezj_app/src/controllers/firebase_controller.dart';
import 'package:ezj_app/src/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:ezj_app/src/utils/app_config.dart' as config;
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<bool> _onBackPressed() {
      return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Você tem certeza'),
              content: Text('Que quer sair do app?'),
              actions: [
                FlatButton(
                  onPressed: () => Get.back(result: false),
                  child: Text("Não"),
                ),
                FlatButton(
                  onPressed: () => Get.back(result: true),
                  child: Text("Sim"),
                ),
              ],
            ),
          ) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                width: config.App(context).appWidth(100),
                height: config.App(context).appHeight(27),
                decoration: BoxDecoration(color: config.Colors().mainColor()),
              ),
            ),
            Positioned(
              top: 40,
              child: Image.network(
                'https://leanfrontiers.com/wp-content/uploads/2018/12/logo-placeholder-png.png',
                width: MediaQuery.of(context).size.width * 0.35,
              ),
            ),
            Positioned(
              top: config.App(context).appHeight(40) - 50,
              child: Container(
                decoration: BoxDecoration(
                    color: config.Colors().mainColor(),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 50, color: config.Colors().mainColor()),
                    ]),
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding:
                    EdgeInsets.only(top: 20, right: 27, left: 27, bottom: 20),
                width: config.App(context).appWidth(88),
                child: Form(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "E-mail",
                            labelStyle: TextStyle(
                                color: config.Colors().backgroundColor()),
                            contentPadding: EdgeInsets.all(12),
                            hintText: "seuemail@gmail.com",
                            hintStyle:
                                TextStyle(color: Colors.grey.withOpacity(0.8)),
                            prefixIcon: Icon(Icons.email,
                                color: config.Colors().backgroundColor()),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Senha",
                            labelStyle: TextStyle(
                                color: config.Colors().backgroundColor()),
                            contentPadding: EdgeInsets.all(12),
                            hintText: '••••••••••••',
                            hintStyle:
                                TextStyle(color: Colors.grey.withOpacity(0.8)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: config.Colors().backgroundColor(),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Login",
                          ),
                          color: config.Colors().backgroundColor(),
                          shape: StadiumBorder(),
                          textColor: config.Colors().mainColor(),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ]),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    textColor: config.Colors().mainColor(),
                    child: Text("Esqueceu sua senha?"),
                  ),
                  FlatButton(
                    onPressed: () {
                      Get.to(SignUpPage());
                    },
                    textColor: config.Colors().mainColor(),
                    child: Text("Eu não tenha uma conta"),
                  )
                ],
              ),
            ),
            Positioned(
              top: config.App(context).appHeight(85) - 50,
              child: OutlineButton(
                color: Colors.white,
                splashColor: Colors.grey,
                onPressed: () {
                  LoginController.to.performLogin();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                borderSide: BorderSide(color: Colors.grey),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                          image: AssetImage("assets/images/google_logo.png"),
                          height: 25.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Faça login com o Google',
                          style: TextStyle(
                            fontSize: 15,
                            color: config.Colors().mainColor(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
