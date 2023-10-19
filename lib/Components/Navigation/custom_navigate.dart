import 'package:flutter/material.dart';

void pushAndRemoved(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);
