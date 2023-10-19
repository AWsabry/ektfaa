import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/Presentations/Splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: EktfaaConstants.applicationName,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }
}
