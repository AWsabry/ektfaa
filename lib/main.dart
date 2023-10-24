import 'package:ektfaa/Auth/SplashScreen.dart';
import 'package:ektfaa/Theme.dart';
import 'package:ektfaa/features/Search/searchCubit.dart';
import 'package:ektfaa/features/SignUp/sign_up_cubit.dart';
import 'package:ektfaa/features/Verification/verification_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    ScreenUtil.ensureScreenSize(),
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => VerificationCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        home: const SplashScreen(),
      ),
    );
  }
}


//I went to bathroom 