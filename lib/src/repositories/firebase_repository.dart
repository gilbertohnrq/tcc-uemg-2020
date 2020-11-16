import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseRepository {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<auth.UserCredential> signIn() async {
    GoogleSignInAccount _signInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication _signInAuthentication =
        await _signInAccount.authentication;

    final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
        accessToken: _signInAuthentication.accessToken,
        idToken: _signInAuthentication.idToken);

    auth.UserCredential user = await _auth.signInWithCredential(credential);
    return user;
  }

  Future<bool> authenticateUser(auth.UserCredential user) async {
    QuerySnapshot result = await firestore
        .collection("users")
        .where("email", isEqualTo: user.user.email)
        .get();

    final List<DocumentSnapshot> docs = result.docs;

    return docs.length == 0 ? true : false;
  }

  Future<void> signOut() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    await _auth.signOut();
    print("##################### USUÁRIO DESLOGADO");
  }

  auth.User getCurrentUser() {
    auth.User currentUser;
    currentUser = _auth.currentUser;
    return currentUser;
  }
}
