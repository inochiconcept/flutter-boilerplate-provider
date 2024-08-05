import 'package:app/pages/navigation/home_page/home_page.dart';
import 'package:app/pages/navigation/item_page/item_page.dart';
import 'package:app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return PageRouteBuilder<dynamic>(
      settings: settings,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        switch (settings.name) {
          case '/':
            return const SplashScreen();
          case '/home':
            return const HomePage();
          case '/item':
            return settings.arguments != Null
                ? ItemPage(item: settings.arguments)
                : const Center();
          default:
            return const Center();
        }
      },
      transitionDuration: const Duration(
          milliseconds: 200), // Set the duration of the transition
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        // You can use different transition effects here based on the settings.name
        if (settings.name == '/home') {
          // Example of a custom transition
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          );
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(curvedAnimation),
            child: child,
          );
        } else {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
          // return child;
        }
      },
    );
  }
}
