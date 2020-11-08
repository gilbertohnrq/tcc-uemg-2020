import 'package:ezj_app/src/controllers/firebase_controller.dart';
import 'package:ezj_app/src/controllers/home_controller.dart';
import 'package:ezj_app/src/controllers/firebase_controller.dart';
import 'package:ezj_app/src/repositories/firebase_repository.dart';
import 'package:ezj_app/src/repositories/hasura_settings.dart';
import 'package:ezj_app/src/repositories/user_repository.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseController>(() => FirebaseController());
    Get.lazyPut<FirebaseRepository>(() => FirebaseRepository());
    Get.lazyPut<UserRepository>(() => UserRepository(), fenix: true);
    Get.lazyPut<HasuraSettings>(() => HasuraSettings(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}
