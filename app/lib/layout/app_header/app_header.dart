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
        padding: EdgeInsets.only(
          bottom: 10,
        ),
        child: AppBar(
          title: const Text("GW"),
        ),
      );
    }),
  );
}
