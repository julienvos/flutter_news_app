import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Bottomtab {
  static const int home = 0;
  static const int categories = 1;
  static const int bookmark = 2;
  static const int profile = 3;
}

// enum LoginInError {
//   none,
//   password,
//   noUser,
// }

class AppStateManager extends ChangeNotifier {
  final auth = FirebaseAuth.instance;

  // LoginInError loginError = LoginInError.none;

  bool _initialized = false;
  bool _logginIn = false;
  bool _boarded = false;
  // bool _skipBoarding = false;

  int _selectedIndex = Bottomtab.home;

  int get selectedIndex => _selectedIndex;

  List<String> _appBarTitles = ['Welcome', 'Categories', 'Bookmark', 'Account'];

  List<String> get appBarTitles => _appBarTitles;

  bool get isInitialized => _initialized;
  // bool get isLoggedin => _logginIn;
  bool get isBoarded => _boarded;
  // bool get skippedBoarding => _skipBoarding;

  // void setBoarded(bool? value) {
  //   if (value != null) {
  //     sharedPrefs.setBool('boarded', value);
  //     _boarded = value;
  //     notifyListeners();
  //   }
  // }

  // void skipBoarded (bool? value) async {
  //   _skipBoarding = true;
  //   await SharedPreferences sharedprefs = SharedPreferences.getInstance();

  //   notifyListeners();
  // }

  void changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void initializeApp() {
    Timer(Duration(milliseconds: 5000), () {
      _initialized = true;
      notifyListeners();
    });
  }

  bool isLoggedin() {
    return auth.currentUser != null;
  }

  String? userId() {
    return auth.currentUser?.uid;
  }

  String? email() {
    return auth.currentUser?.email;
  }

  void signup(String email, String password) async {
    try {
      // 2
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // 3
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      // 4
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      // 5
      print(e);
    }
  }

  login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else if (e.code == 'user-not-found') {
        print('hallo');
        // loginError = LoginInError.noUser;
        return "gebruiker bestaat niet";
      }
    } catch (e) {
      print(e);
    }
  }

// Future<UserCredential>
  void signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await auth.signInWithCredential(credential);
    notifyListeners();
  }

  signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    await auth.signInWithCredential(facebookAuthCredential);
    notifyListeners();
  }

  void logout() async {
    await auth.signOut();
    notifyListeners();
  }

  void onBoarded() {
    _boarded = true;
    notifyListeners();
  }
}

final AppStateManager appStateManager = AppStateManager();
