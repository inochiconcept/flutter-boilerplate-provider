import 'package:app/layout/app_header/nav_header.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  final dynamic item;
  const ItemPage({@required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navHeader(title: item['name']),
      body: Text(item.toString()),
    );
  }
}
