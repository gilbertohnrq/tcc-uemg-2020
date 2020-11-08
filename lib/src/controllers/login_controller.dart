import 'package:ezj_app/models/user.dart';
import 'package:ezj_app/src/pages/home_page.dart';
import 'package:ezj_app/src/pages/login_page.dart';
import 'package:ezj_app/src/controllers/firebase_controller.dart';
import 'package:ezj_app/src/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:get/get.dart';

import 'home_controller.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find<LoginController>();

  void performLogin() {
    FirebaseController.to.signIn().then((auth.UserCredential user) {
      if (user != null) {
        authenticateUser(user);
      } else {
        print("Houve um erro");
      }
    });
  }

  void authenticateUser(
    auth.UserCredential user,
  ) {
    FirebaseController.to.authenticateUser(user).then((isNewUser) async {
      print("######################### $user");
      User _user = new User(
        uid: user.user.uid,
        name: user.user.displayName,
        email: user.user.email,
        profilePhoto: user.user.photoURL,
      );

      if (isNewUser) {
        HomeController.to.currentUser = await checkIfUserIsOnHasuraDb(_user);
        Get.offAll(HomePage());
      } else {
        HomeController.to.currentUser = await checkIfUserIsOnHasuraDb(_user);
        Get.offAll(HomePage());
      }
    });
  }

  Future<User> checkIfUserIsOnHasuraDb(User _user) async {
    User getUser = await UserRepository.to.getUserByEmail(_user.email);
    if (getUser.isNull) {
      getUser = await UserRepository.to.adduser(_user);
    }
    return getUser;
  }
}
