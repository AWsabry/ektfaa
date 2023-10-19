import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/Features/SignUp/signUp_cubit.dart';
import 'package:ektfaa/Presentations/Splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignUpCubit(),
        )
      ],
      child: MaterialApp(
          title: EktfaaConstants.applicationName,
          debugShowCheckedModeBanner: false,
          home: const SplashScreen()),
    );
  }
}
