import 'package:flutter/material.dart';

class RRuleGeneratorConfig {
  RRuleGeneratorConfig({
    this.textFieldBorderColor = Colors.grey,
    this.weekdayColor = Colors.white,
    this.weekdayBackgroundColor = Colors.black54,
    this.weekdaySelectedColor = Colors.white,
    this.weekdaySelectedBackgroundColor = Colors.blueAccent,
    this.textFieldBorderRadius = const Radius.circular(8),
    this.headerTextStyle = const TextStyle(),
    this.textStyle = const TextStyle(),
    this.headerEnabled = true,
  });

  final bool headerEnabled;
  final Radius textFieldBorderRadius;
  final TextStyle textStyle;
  final TextStyle headerTextStyle;
  final Color weekdaySelectedColor;
  final Color weekdaySelectedBackgroundColor;
  final Color weekdayColor;
  final Color weekdayBackgroundColor;
  final Color textFieldBorderColor;
}
