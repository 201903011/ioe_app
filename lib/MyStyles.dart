import 'package:flutter/material.dart';

class MyStyle {
  static TextStyle smalltext(BuildContext context, Color color) => TextStyle(
        color: color,
        fontSize: 10,
      );

  static TextStyle header1(BuildContext context, Color color) => TextStyle(
        fontWeight: FontWeight.w700,
        color: color,
        fontSize: 18,
      );

  static TextStyle header2(BuildContext context, Color color) => TextStyle(
        fontWeight: FontWeight.w700,
        color: color,
        fontSize: 14,
      );

  static TextStyle see(BuildContext context, Color color) => TextStyle(
        fontWeight: FontWeight.w900,
        color: color,
        fontSize: 10,
      );

  static TextStyle small(BuildContext context, Color color) => TextStyle(
        fontWeight: FontWeight.w500,
        color: color,
        fontSize: 10,
      );

  static TextStyle tiny(BuildContext context, Color color) => TextStyle(
        color: color,
        fontSize: 10,
      );

  static TextStyle smallheading(BuildContext context, Color color) => TextStyle(
        fontWeight: FontWeight.w800,
        color: color,
        fontSize: 10,
      );
}
