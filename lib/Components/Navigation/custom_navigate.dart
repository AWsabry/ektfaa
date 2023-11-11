import 'package:flutter/material.dart';

void pushAndRemoved(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

void push(context, widget,
    {Duration duration = const Duration(seconds: 0),
    Curve curves = Curves.ease,
    bool isSlideTransition = false}) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, a1, a2) => widget,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Alignment.topCenter;
        var beginSlideTransition = const Offset(1.0, 0.0);

        var end = Alignment.center;
        var endSlideTransition = Offset.zero;
        var curve = curves;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var tweenSlideTransition =
            Tween(begin: beginSlideTransition, end: endSlideTransition)
                .chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tweenSlideTransition);

        if (isSlideTransition == true) {
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        } else {
          return AlignTransition(
            alignment: animation.drive(tween),
            // turns: animation.drive(tween),
            child: child,
          );
        }
      },
    ),
  );
}
