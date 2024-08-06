// ignore_for_file: unused_import

import 'dart:developer';

import 'package:app/config.dart';
import 'package:app/providers/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FloatingBtn extends StatelessWidget {
  const FloatingBtn({super.key});

  @override
  Widget build(BuildContext context) {
    var gP = Provider.of<GlobalProvider>(context, listen: true);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {},
          child: const Center(
            child: Icon(
              // Iconsax.main_component,
              Icons.place_rounded,
              size: 35,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: -5,
          right: -5,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Center(
              child: Text(
                "2",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
