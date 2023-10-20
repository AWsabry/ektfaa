import 'package:flutter/material.dart';
import 'package:ektfaa/Auth/OnBoardingScreen.dart';
import 'package:ektfaa/Auth/SplashScreen.dart';
import 'package:ektfaa/Screens/DashBoard.dart';
import 'package:ektfaa/Theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Auth/SignUp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    ScreenUtil.ensureScreenSize(),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      home: SplashScreen(),
    );
  }
}
