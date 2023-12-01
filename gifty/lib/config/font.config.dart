import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';

class AppTextStyles {
  static const TextStyle _title = TextStyle(
      fontSize: 34,
      fontFamily: 'Luxembourg',
      fontWeight: FontWeight.w600,
      color: AppColor.main);

  static const TextStyle _subtitle = TextStyle(
      fontSize: 24,
      fontFamily: 'Louis George Cafe ',
      fontWeight: FontWeight.normal,
      color: Color.fromARGB(255, 41, 50, 54));

  static const TextStyle _text = TextStyle(
      fontSize: 20,
      fontFamily: 'Louis George Cafe',
      fontWeight: FontWeight.normal,
      color: Color.fromARGB(255, 41, 50, 54));

  static const TextStyle _inter_heading = TextStyle(
    fontSize: 20,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: AppColor.main,
  );

  static const TextStyle _inter_title = TextStyle(
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    color: AppColor.main,
    shadows: [
      Shadow(
        color: Color.fromRGBO(0, 0, 0, 0.3),
        offset: Offset(0, 2),
        blurRadius: 4,
      ),
    ],
  );

  static const TextStyle _inter_subtitle = TextStyle(
    fontSize: 12,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    color: AppColor.main,
  );

  static TextStyle get title => _title;
  static TextStyle get subtitle => _subtitle;
  static TextStyle get text => _text;
  static TextStyle get interHeading => _inter_heading;
  static TextStyle get interTitle => _inter_title;
  static TextStyle get interSubitle => _inter_subtitle;

  static TextStyle get CopyRightText =>
      _text.copyWith(color: Colors.white, fontSize: 16);
  static TextStyle get Onboardingdescription =>
      _subtitle.copyWith(color: Colors.white, fontSize: 16);
  static TextStyle get ButtonText =>
      _subtitle.copyWith(color: Colors.white, fontFamily: 'Google Sans');
  static TextStyle get welcomeText =>
      _text.copyWith(color: Colors.white, fontWeight: FontWeight.bold);
  static TextStyle get loginText =>
      _title.copyWith(fontSize: 32, fontWeight: FontWeight.w400);
  static TextStyle get loginText2 =>
      _text.copyWith(fontSize: 16, fontWeight: FontWeight.w400);
}
