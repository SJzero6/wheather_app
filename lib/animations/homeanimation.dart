import 'package:flutter/material.dart';
import 'package:wheather_app/home.dart';
import 'package:wheather_app/register.dart';

PageRouteBuilder<dynamic> Homebouncy() {
  return PageRouteBuilder(
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: ((context, animation, secondaryAnimation, child) {
        animation =
            CurvedAnimation(parent: animation, curve: ElasticOutCurve());
        return ScaleTransition(
          scale: animation,
          alignment: Alignment.center,
          child: child,
        );
      }),
      pageBuilder: ((context, animation, secondaryAnimation) {
        return Homepage();
      }));
}
