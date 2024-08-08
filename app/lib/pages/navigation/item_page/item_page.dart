import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  final dynamic item;
  const ItemPage({@required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']),
      ),
      body: Text(item.toString()),
    );
  }
}
