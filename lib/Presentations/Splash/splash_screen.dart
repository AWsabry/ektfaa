import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/Components/Navigation/custom_navigate.dart';
import 'package:ektfaa/Presentations/SignUp/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  init(context) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      pushAndRemoved(context, SignUp());
    });
  }

  @override
  Widget build(BuildContext context) {
    init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(EktfaaConstants.splashImage),
          ),
          const SizedBox(height: 20),
          Text(
            EktfaaConstants.applicationName,
            style: GoogleFonts.montserrat(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: const Color.fromARGB(255, 12, 165, 22)),
          ),
        ],
      ))),
    );
  }
}
