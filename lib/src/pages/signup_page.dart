import 'package:flutter/material.dart';
import 'package:ezj_app/src/utils/app_config.dart' as config;
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  Widget _buildTextField(
      {String labelText,
      bool obscureText,
      TextInputType keyboardType,
      String hintText,
      Widget prefixIcon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: config.Colors().mainColor()),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30)),
          fillColor: config.Colors().backgroundColor(),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }

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
          height: 600,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: config.Colors().mainColor(),
            boxShadow: [
              BoxShadow(blurRadius: 10),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Form(
            child: Column(
              children: [
                SizedBox(height: 10),
                Image.network(
                  "https://leanfrontiers.com/wp-content/uploads/2018/12/logo-placeholder-png.png",
                  width: MediaQuery.of(context).size.width * 0.30,
                ),
                SizedBox(height: 10),
                _buildTextField(
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  labelText: "Nome",
                  hintText: "Digite seu nome",
                  prefixIcon:
                      Icon(Icons.person, color: config.Colors().mainColor()),
                ),
                SizedBox(height: 30),
                _buildTextField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  labelText: "E-mail",
                  hintText: "Digite seu e-mail",
                  prefixIcon: Icon(
                    Icons.mail,
                    color: config.Colors().mainColor(),
                  ),
                ),
                SizedBox(height: 30),
                _buildTextField(
                  keyboardType: TextInputType.phone,
                  obscureText: false,
                  labelText: "Telefone",
                  hintText: "Digite seu telefone",
                  prefixIcon: Icon(
                    Icons.phone,
                    color: config.Colors().mainColor(),
                  ),
                ),
                SizedBox(height: 30),
                _buildTextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  labelText: "Senha",
                  hintText: "Digite sua senha",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: config.Colors().mainColor(),
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
