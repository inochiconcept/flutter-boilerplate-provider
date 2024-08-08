import 'package:flutter/material.dart';

PreferredSize navHeader({
  required String title,
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
          title: Text(title),
        ),
      );
    }),
  );
}
