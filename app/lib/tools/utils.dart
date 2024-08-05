import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Tools {
  void openUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {}
  }

  dynamic getOfflineData(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(name);
  }

  void saveOfflineData(String name, dynamic data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = json.encode(data);
    prefs.setString(name, value);
  }

  void deleteOfflineData(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(name);
  }

  void clearOfflineData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
