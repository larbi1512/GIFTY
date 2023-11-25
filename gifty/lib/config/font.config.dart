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


  static TextStyle get title => _title;
  static TextStyle get subtitle => _subtitle;
  static TextStyle get text => _text;

  static TextStyle get CopyRightText => _text.copyWith(color: Colors.white, fontSize: 16);
  static TextStyle get Onboardingdescription => _subtitle.copyWith(color: Colors.white, fontSize: 16);
  static TextStyle get ButtonText => _subtitle.copyWith(color: Colors.white, fontFamily: 'Google Sans');
  static TextStyle get welcomeText => _text.copyWith(color: Colors.white, fontWeight: FontWeight.bold);
  


}

