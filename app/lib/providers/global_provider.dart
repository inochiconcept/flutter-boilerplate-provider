// ignore_for_file: unused_import, no_leading_underscores_for_local_identifiers, empty_catches

import 'dart:developer';

import 'package:flutter/widgets.dart';

class GlobalProvider extends ChangeNotifier {
  GlobalProvider._privateConstructor();
  static final GlobalProvider _instance = GlobalProvider._privateConstructor();
  factory GlobalProvider() {
    return _instance;
  }

  String testA = "Start";
  int testB = 0;

  Future initGlobalState() async {
    try {
      log("-------init-global-state-----");

      log("-------end-global-state-----");
      notifyListeners();
    } catch (e) {
      log('init state error: $e');
    }
  }

  void changeTestA() {
    testA = "Changed";
    notifyListeners();
  }

  void changeTestB() {
    testB++;
    notifyListeners();
  }
}
