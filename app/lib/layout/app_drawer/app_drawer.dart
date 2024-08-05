import 'package:app/i18n/lang.dart';
import 'package:app/providers/global_provider.dart';
import 'package:app/providers/lang_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  Map<String, dynamic> getLanguageByCode(String code) {
    for (var lang in allLangs) {
      if (lang['code'] == code) {
        return lang;
      }
    }
    return allLangs[
        0]; // Return null if no language with the provided code is found
  }

  @override
  Widget build(BuildContext context) {
    var gP = Provider.of<GlobalProvider>(context, listen: true);
    var lP = Provider.of<LangProvider>(context, listen: true);
    final dynamic _ = Provider.of<LangProvider>(context, listen: true).ln;

    return const Drawer(
      child: Column(),
    );
  }
}
