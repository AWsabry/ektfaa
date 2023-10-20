import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:ektfaa/Auth/SignIn.dart';
import 'package:ektfaa/Theme.dart';

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
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do',
            image: buildImage('assets/Images/01.jpg'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'If it EXIST, it\'s OK',
            body:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do',
            image: buildImage1('assets/Images/ob_2.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Always there\'re similar products',
            body:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do',
            image: buildImage2('assets/Images/ob_3.png'),
            decoration: getPageDecoration(),
          ),
        ],
        done: Text(
          'Done',
          style: TextStyle(
              fontWeight: FontWeight.w500, color: AppColors.redAccent),
        ),
        onDone: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignIn()));
        },
        next: Icon(Icons.arrow_forward_ios, color: AppColors.redAccent),
        dotsDecorator: getdotdecorator(),
      ),
    );
  }

  Widget buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/Images/01.jpg', width: width);
  }

  Widget buildImage1(String assetName, [double width = 350]) {
    return Image.asset('assets/Images/ob_2.png', width: width);
  }

  Widget buildImage2(String assetName, [double width = 350]) {
    return Image.asset('assets/Images/ob_3.png', width: width);
  }

  DotsDecorator getdotdecorator() => DotsDecorator(
        size: Size(10.0, 10.0),
        activeColor: AppColors.blackColor,
        color: Color(0xFFBDBDBD),
        activeSize: Size(42.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        bodyTextStyle: TextStyle(fontSize: 15, color: Colors.grey),
        bodyPadding: EdgeInsets.all(16),
        imagePadding: EdgeInsets.all(24),
      );
}
