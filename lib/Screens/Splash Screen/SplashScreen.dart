import 'dart:async';

import 'package:ektfaa/Components/Navigation/custom_navigate.dart';
import 'package:ektfaa/Screens/Auth/OnBoardingScreen.dart';
import 'package:ektfaa/Screens/DashBoard.dart';
import 'package:ektfaa/features/SignIn/sign_in_cubit.dart';
import 'package:ektfaa/features/SignUp/sign_up_cubit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SignUpCubit.get(context).getphoneFromSharedPrefreance();
    Future.delayed(const Duration(seconds: 2), () {
      if (SignUpCubit.get(context).phoneFromSharedPreference.isNotEmpty) {
        SignInCubit.get(context).checkUserByPhone(
            SignUpCubit.get(context).phoneFromSharedPreference);

        pushAndRemoved(context, const DashBoard());
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Images/1.png',
              height: 600,
            ),
          ],
        ),
      ),
    );
  }
}
