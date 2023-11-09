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
    fetchData();
  }

  Future<void> fetchData() async {
    SignUpCubit.get(context).getPhoneFromSharedPreference();
    SignInCubit.get(context)
        .checkUserByPhone(SignUpCubit.get(context).phoneFromSharedPreference);

    // Since we've awaited the data retrieval, it should be available here
    Future.delayed(const Duration(milliseconds: 1500)).then((value) async {
      if (SignInCubit.get(context).userInformation.isEmpty &&
          SignUpCubit.get(context).phoneFromSharedPreference.isEmpty) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
      } else {
        SignInCubit.get(context).checkUserByPhone(
            SignUpCubit.get(context).phoneFromSharedPreference);

        pushAndRemoved(
          context,
          DashBoard(
            selectedIndex: 0,
          ),
        );
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
