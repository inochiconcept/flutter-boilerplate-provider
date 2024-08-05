import 'package:flutter/material.dart';

class GoButton extends StatelessWidget {
  final String txt;
  const GoButton({required this.txt, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(txt),
    );
  }
}
