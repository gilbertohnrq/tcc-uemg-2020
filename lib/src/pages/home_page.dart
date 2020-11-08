import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezj_app/src/bindings/login_binding.dart';
import 'package:ezj_app/src/controllers/home_controller.dart';
import 'package:ezj_app/src/controllers/login_controller.dart';
import 'package:ezj_app/src/pages/login_page.dart';
import 'package:ezj_app/src/controllers/firebase_controller.dart';
import 'package:flutter/material.dart';
import 'package:ezj_app/src/utils/app_config.dart' as config;
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  List<String> testeImages = [
    "https://homepages.cae.wisc.edu/~ece533/images/airplane.png",
    "https://homepages.cae.wisc.edu/~ece533/images/boat.png",
    "https://homepages.cae.wisc.edu/~ece533/images/barbara.png",
    "https://homepages.cae.wisc.edu/~ece533/images/baboon.png",
    "https://homepages.cae.wisc.edu/~ece533/images/arctichare.png"
  ];

  @override
  Widget build(BuildContext context) {
    CardController controller;
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
      body: Center(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: TinderSwapCard(
                swipeUp: false,
                swipeDown: false,
                orientation: AmassOrientation.BOTTOM,
                totalNum: testeImages.length,
                stackNum: 3,
                swipeEdge: 4.0,
                maxWidth: MediaQuery.of(context).size.width * 0.9,
                maxHeight: MediaQuery.of(context).size.width * 0.9,
                minWidth: MediaQuery.of(context).size.width * 0.8,
                minHeight: MediaQuery.of(context).size.width * 0.8,
                cardBuilder: (context, index) => Card(
                  child: Image.network('${testeImages[index]}'),
                ),
                cardController: controller = CardController(),
                swipeUpdateCallback:
                    (DragUpdateDetails details, Alignment align) {
                  /// Get swiping card's alignment
                  if (align.x < 0) {
                    //Card is LEFT swiping
                    print("JOGANDO PRA ESQUERDA");
                  } else if (align.x > 0) {
                    //Card is RIGHT swiping
                    print("JOGANDO PRA DIREITA");
                  }
                },
                swipeCompleteCallback:
                    (CardSwipeOrientation orientation, int index) {
                  print("Dentro do complete");

                  /// Get orientation & index of swiped card!
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 60,
                    width: 60,
                    child: FlatButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.green,
                        size: 30,
                      ),
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(width: 60),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 60,
                    width: 60,
                    child: FlatButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      child: Icon(
                        Icons.block,
                        color: Colors.red,
                        size: 30,
                      ),
                      color: Colors.grey[300],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
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
