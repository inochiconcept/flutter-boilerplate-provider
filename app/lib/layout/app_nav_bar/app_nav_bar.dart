import 'package:app/layout/app_nav_bar/navbar_item.dart';
import 'package:app/providers/global_provider.dart';
import 'package:app/providers/lang_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBottomNavBar extends StatelessWidget {
  final String? route;
  const AppBottomNavBar({
    super.key,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    var gP = Provider.of<GlobalProvider>(context, listen: true);
    final dynamic _ = Provider.of<LangProvider>(context, listen: true).ln;
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      notchMargin: 5,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          NavBarItem(
            icon: Icons.home,
            link: '/home',
            label: 'home',
            disabled: false,
            active: route == 'home',
          ),
          NavBarItem(
            icon: Icons.map,
            link: '/home',
            label: 'Map',
            disabled: false,
            active: route == 'map',
          ),
          NavBarItem(
            icon: Icons.book,
            link: '/home',
            label: 'Booking',
            disabled: false,
            active: route == 'booking',
          ),
          NavBarItem(
            icon: Icons.settings,
            link: '/home',
            label: 'Settings',
            disabled: true,
            active: route == 'settings',
          ),
          const SizedBox(
            width: 60,
          ),
        ],
      ),
    );
  }
}
