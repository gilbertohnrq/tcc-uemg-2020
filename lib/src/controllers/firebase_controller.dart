import 'package:ezj_app/src/repositories/firebase_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:get/get.dart';

class FirebaseController {
  static FirebaseController get to => Get.find<FirebaseController>();

  FirebaseRepository _firebaseRepository = Get.find();

  Future<auth.UserCredential> signIn() => _firebaseRepository.signIn();

  Future<bool> authenticateUser(auth.UserCredential user) =>
      _firebaseRepository.authenticateUser(user);

  Future signOut() => _firebaseRepository.signOut();
}
