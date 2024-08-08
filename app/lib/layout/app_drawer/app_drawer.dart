import 'package:app/config.dart';
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

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: const Text('Home'),
                      subtitle: const Text('Home Screen'),
                      dense: true,
                      onTap: () {
                        globalNav.currentState?.popAndPushNamed("/home");
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Profile'),
                      subtitle: const Text('Edit your profile'),
                      dense: true,
                      onTap: () {
                        globalNav.currentState?.popAndPushNamed("/home");
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Settings'),
                      subtitle: const Text('App Preferences'),
                      dense: true,
                      onTap: () {
                        globalNav.currentState?.popAndPushNamed("/home");
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              subtitle: const Text('App Preferences'),
              dense: true,
              onTap: () {
                globalNav.currentState?.popAndPushNamed("/home");
              },
            ),
          ],
        ),
      ),
    );
  }
}
