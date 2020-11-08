import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezj_app/src/bindings/login_binding.dart';
import 'package:ezj_app/src/controllers/home_controller.dart';
import 'package:ezj_app/src/controllers/login_controller.dart';
import 'package:ezj_app/src/pages/login_page.dart';
import 'package:ezj_app/src/controllers/firebase_controller.dart';
import 'package:flutter/material.dart';
import 'package:ezj_app/src/utils/app_config.dart' as config;
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CachedNetworkImage(
          fit: BoxFit.contain,
          height: 77,
          imageUrl:
              "https://leanfrontiers.com/wp-content/uploads/2018/12/logo-placeholder-png.png",
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        centerTitle: true,
        backgroundColor: config.Colors().mainColor(),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://image.freepik.com/fotos-gratis/paisagem-da-ponte-arborizada-no-porto-entre-o-por-do-sol_38927-17.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              accountName: Text("${HomeController.to.currentUser.name}"),
              accountEmail: Text("${HomeController.to.currentUser.email}"),
              currentAccountPicture: CachedNetworkImage(
                imageUrl: "${HomeController.to.currentUser.profilePhoto}",
                errorWidget: (context, url, error) => Icon(Icons.error),
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  radius: 50,
                  backgroundImage: imageProvider,
                ),
              ),
              // CircleAvatar(
              //   radius: 30.0,
              //   backgroundImage: CachedNetworkImageProvider(
              //       "${HomeController.to.currentUser.profilePhoto}",),
              //   backgroundColor: Colors.transparent,
              // ),
            ),
            ListTile(
              leading: Icon(
                Icons.edit,
              ),
              title: Text(
                "Editar Perfil",
              ),
            ),
            ListTile(
              onTap: () async {
                await FirebaseController.to.signOut();
                Get.to(LoginPage(), binding: LoginBinding());
              },
              leading: Icon(Icons.power_settings_new),
              title: Text("Sair da conta"),
            ),
          ],
        ),
      ),
    );
  }
}
