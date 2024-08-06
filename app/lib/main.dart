import 'dart:developer';

import 'package:app/config.dart';
import 'package:app/providers/global_provider.dart';
import 'package:app/providers/lang_provider.dart';
import 'package:app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) async {
    mainApp();
    initializeDateFormatting('en', null);
    initializeDateFormatting('fr', null);
  });
}

void mainApp() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => GlobalProvider()),
          ChangeNotifierProvider(create: (_) => LangProvider()),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    log('*******GFM*******');
    var lP = Provider.of<LangProvider>(context, listen: true);
    return MaterialApp(
      navigatorKey: globalNav,
      builder: (buildContext, child) {
        TextDirection dir =
            lP.currentLang == "ar" ? TextDirection.rtl : TextDirection.ltr;
        return MediaQuery(
          data: MediaQuery.of(buildContext).copyWith(
              textScaler: MediaQuery.textScalerOf(buildContext)
                  .clamp(minScaleFactor: 0, maxScaleFactor: 1)),
          child: Stack(
            children: [
              Directionality(
                textDirection: dir,
                child: child!,
              ),
              // const OnboardingWidget(),
            ],
          ),
        );
      },
      title: appName,
      theme: ThemeData(
        primaryColor: const Color(mainColor),
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(mainColor),
            onPrimary: Colors.white,
            secondary: Color(secColor),
            onSecondary: Colors.white,
            error: Colors.redAccent,
            onError: Colors.white,
            background: Colors.white,
            onBackground: Colors.black,
            surface: Color(colYellow),
            onSurface: Colors.black),
        fontFamily: 'Barlow',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          // brightness: Brightness.dark,
          iconTheme: IconThemeData(color: Color(mainColor)),
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: '/',
    );
  }
}
