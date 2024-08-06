import 'package:app/layout/app_drawer/app_drawer.dart';
import 'package:app/layout/app_header/app_header.dart';
import 'package:app/layout/app_nav_bar/app_nav_bar.dart';
import 'package:app/layout/app_nav_bar/floating_btn.dart';
import 'package:app/providers/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var gP = Provider.of<GlobalProvider>(context, listen: true);
    return Scaffold(
      appBar: appHeader(
        title: "home",
        logo: true,
      ),
      drawer: const AppDrawer(),
      floatingActionButton: const FloatingBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: const AppBottomNavBar(
        route: "home",
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          gP.initGlobalState();
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(child: Text('Test A : ${gP.testA}')),
            TextButton(
              onPressed: () {
                gP.changeTestA();
              },
              child: const Text('Change A'),
            ),
            const SizedBox(height: 30),
            Center(child: Text('Test A : ${gP.testB}')),
            TextButton(
              onPressed: () {
                GlobalProvider().changeTestB();
              },
              child: const Text('Change B'),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                GlobalProvider().getAllData();
              },
              child: const Text('Fetch All Data'),
            ),
            Center(child: Text('Count : ${gP.allData?["count"]}')),
            Column(
              children: gP.allData?['results'] != null
                  ? (gP.allData!['results'] as List).map((item) {
                      return Text('${item["name"]}');
                    }).toList()
                  : [],
            ),
          ],
        ),
      ),
    );
  }
}
