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
    return const BottomAppBar(
      shape: CircularNotchedRectangle(),
      elevation: 3,
      color: Colors.orange,
      surfaceTintColor: Colors.blue,
      clipBehavior: Clip.antiAlias,
      notchMargin: 5,
      padding: EdgeInsets.all(0),
    );
  }
}
