import 'package:aplikasi_ecommerce/splash/splash.dart';
import 'package:aplikasi_ecommerce/onboarding/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  runApp(MyApp(navigatorKey: navigatorKey));
}

class MyApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp({required this.navigatorKey, Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: widget.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      title: "Toko Online",
      initialRoute: '/',
      routes: {
        '/onboarding': (context) => const OnboardingPage(),
      },
      home: SplashScreen(navigatorKey: widget.navigatorKey),
    );
  }
}
