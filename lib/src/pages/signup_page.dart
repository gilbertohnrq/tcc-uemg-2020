import 'package:flutter/material.dart';
import 'package:ezj_app/src/helpers/app_config.dart' as config;
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return (await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Tem certeza?"),
                content: Text("Quer mesmo sair do formulário de cadastro?"),
                actions: [
                  FlatButton(
                    onPressed: () => Get.back(result: true),
                    child: Text("Sim"),
                  ),
                  FlatButton(
                    onPressed: () {
                      Get.back(result: false);
                    },
                    child: Text("Não"),
                  ),
                ],
              ),
            )) ??
            false;
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: config.Colors().mainColor(),
          title: Text("Cadastre-se no App"),
        ),
        body: Container(
          child: Form(
            child: Column(
              children: [
                SizedBox(height: 30),
                TextFormField(
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: TextStyle(color: config.Colors().mainColor()),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30)),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Digite sua nome",
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                    prefixIcon: Icon(
                      Icons.person,
                      color: config.Colors().mainColor(),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    labelStyle: TextStyle(color: config.Colors().mainColor()),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30)),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Digite seu e-mail",
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                    prefixIcon: Icon(
                      Icons.mail,
                      color: config.Colors().mainColor(),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: "Telefone",
                    labelStyle: TextStyle(color: config.Colors().mainColor()),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30)),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Digite seu telefone",
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: config.Colors().mainColor(),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(color: config.Colors().mainColor()),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30)),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Digite sua senha",
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: config.Colors().mainColor(),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  height: 50,
                  width: 240,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text("Salvar"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
