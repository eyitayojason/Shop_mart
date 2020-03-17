import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'HomePage.dart';

class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  bool isSignIn = false;

  BuildContext context;
  loginWithGoogle() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    AuthResult result = (await _auth.signInWithCredential(credential));

    _user = result.user;

    // setState(() {

    //   isSignIn = true;

    // });
  }

  Future<void> googleSignout() async {
    await _auth.signOut().then((onValue) {
      _googleSignIn.signOut();

      // setState(() {

      //   isSignIn = true;

      // });
    });
  }
}
