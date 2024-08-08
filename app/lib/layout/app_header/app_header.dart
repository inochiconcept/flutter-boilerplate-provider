import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

PreferredSize appHeader({
  required String title,
  required bool logo,
  void Function()? actionFct,
}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(70),
    child: Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        child: AppBar(
          centerTitle: true,
          title: const Text("GW"),
          actions: const [
            CircleAvatar(
              child: Text('GW'),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
      );
    }),
  );
}
