import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Bottomtab {
  static const int home = 0;
  static const int categories = 1;
  static const int bookmark = 2;
  static const int profile = 3;
}

class AppStateManager extends ChangeNotifier {
  final auth = FirebaseAuth.instance;

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

  void login(String email, String password) async {
    try {
      // 2
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // 3
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    void logout() async {
      await auth.signOut();
      notifyListeners();
    }
  }

  void onBoarded() {
    _boarded = true;
    notifyListeners();
  }
}

final AppStateManager appStateManager = AppStateManager();
