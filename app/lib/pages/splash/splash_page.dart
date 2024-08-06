import 'dart:async';

import 'package:app/config.dart';
import 'package:app/providers/global_provider.dart';
import 'package:app/services/push_notification_service.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double logo = 0;
  Timer? timer;
  @override
  void initState() {
    initSplash();
    PushNotificationService().initOneSignal();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void initSplash() async {
    await GlobalProvider().initGlobalState();
    setState(() {
      logo = 1;
    });
    timer = Timer(const Duration(milliseconds: 2000), () async {
      globalNav.currentState!.pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 3000),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
            color: Colors.white,
            gradient: RadialGradient(
              radius: logo * 1.5,
              colors: const [
                Colors.white,
                Colors.grey,
              ],
            )),
        child: AnimatedScale(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeOut,
          scale: 1.1 + -logo * 0.1,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                      "assets/logo/logo.png",
                      width: 130,
                    ),
                  ),
                ),
                const Text(
                  "Flutter",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Boilerplate",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
