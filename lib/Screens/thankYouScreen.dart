import 'package:flutter/material.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
            'Thank you for uploading your product, we will review it and come back to you'),
      ),
    );
  }
}
