import 'package:ektfaa/Screens/Auth/SignIn.dart';
import 'package:ektfaa/Theme.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Check Product Manufacturer',
            body:
                'Ektfaa give you the ability to know more about the arabic products in your location.',
            image: buildImage('assets/Images/arab.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'If it EXISTS, it\'s ARABIC',
            body:
                'Ektfaa supports you with a search engine to give you more information about the arabic products.',
            image: buildImage1('assets/Images/09.jpg'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Lets have our Ektfaa !',
            body: 'If the results appear, it\'s arabic, otherwise it\'s not.',
            image: buildImage2('assets/Images/06.jpg'),
            decoration: getPageDecoration(),
          ),
        ],
        done: const Text(
          'Done',
          style: TextStyle(
              fontWeight: FontWeight.w500, color: AppColors.redAccent),
        ),
        onDone: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const SignIn()));
        },
        next: const Icon(Icons.arrow_forward_ios, color: AppColors.redAccent),
        dotsDecorator: getdotdecorator(),
      ),
    );
  }

  Widget buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/Images/arab.png', width: width);
  }

  Widget buildImage1(String assetName, [double width = 350]) {
    return Image.asset('assets/Images/09.jpg', width: width);
  }

  Widget buildImage2(String assetName, [double width = 350]) {
    return Image.asset('assets/Images/06.jpg', width: width);
  }

  DotsDecorator getdotdecorator() => const DotsDecorator(
        size: Size(10.0, 10.0),
        activeColor: AppColors.blackColor,
        color: Color(0xFFBDBDBD),
        activeSize: Size(42.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      );

  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        bodyTextStyle: TextStyle(fontSize: 15, color: Colors.grey),
        bodyPadding: EdgeInsets.all(16),
        imagePadding: EdgeInsets.all(24),
      );
}
