import 'package:ezj_app/models/user.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
   static HomeController get to => Get.find<HomeController>();
  User currentUser = new User();
}