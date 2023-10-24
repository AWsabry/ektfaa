import 'package:ektfaa/Auth/SplashScreen.dart';
import 'package:ektfaa/Theme.dart';
import 'package:ektfaa/features/searchCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsCubit(),
        )
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