import 'package:flutter/material.dart';
import 'package:app/i18n/lang.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:devicelocale/devicelocale.dart';

class LangProvider extends ChangeNotifier {
  LangProvider._privateConstructor();
  static final LangProvider _instance = LangProvider._privateConstructor();
  factory LangProvider() {
    return _instance;
  }
  String currentLang = 'en';
  dynamic ln = langs['en'];

  dynamic checkUserLang() async {
    String lang = currentLang;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? prefLang = prefs.getString("userLang");
    if (prefLang != null) {
      lang = prefLang;
    } else {
      String? locale = await Devicelocale.currentLocale;
      String sub = locale!.substring(0, locale.indexOf("-"));
      if (langs[sub] != null) {
        lang = sub;
      }
    }
    return setlang(lang);
  }

  dynamic setlang(String lang) async {
    currentLang = lang;
    ln = correctLangMissingKeys(langs['en'], langs[lang]);

    if (lang == "en") {
      Intl.defaultLocale = 'en';
    } else {
      Intl.defaultLocale = 'fr';
    }
    debugPrint("------SET-LANG-----");
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userLang", lang);
    //return await GlobalProvider().initGlobalState();
  }

  dynamic correctLangMissingKeys(dynamic A, dynamic B) {
    // Helper function to recursively update nested arrays
    void updateNestedArrays(Map mapA, Map mapB) {
      mapA.forEach((key, value) {
        if (!mapB.containsKey(key)) {
          // If the key doesn't exist in B, add it with its value from A
          mapB[key] = value;
        } else if (value is List && mapB[key] is List) {
          // If the value is a list and exists in both A and B
          List listA = value;
          List listB = mapB[key];
          if (listA.length > listB.length) {
            // If the array in A is longer than in B, extend it
            for (int i = listB.length; i < listA.length; i++) {
              listB.add(listA[i]);
            }
          }
        } else if (value is Map && mapB[key] is Map) {
          // If the value is a nested map, recursively update
          updateNestedArrays(value, mapB[key]);
        }
      });
    }

    // Iterate over properties in A
    A.forEach((key, value) {
      if (!B.containsKey(key)) {
        // If the key doesn't exist in B, add it with its value from A
        B[key] = value;
      } else if (value is Map && B[key] is Map) {
        // If the value is a nested map, recursively update
        updateNestedArrays(value, B[key]);
      }
    });

    return B;
  }
}
