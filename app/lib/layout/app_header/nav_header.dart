import 'package:flutter/widgets.dart';

PreferredSize navHeader({
  required String title,
  required bool logo,
  void Function()? actionFct,
}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(70),
    child: Builder(builder: (context) {
      return const Padding(
        padding: EdgeInsets.only(
          bottom: 10,
        ),
      );
    }),
  );
}
