import 'package:flutter/material.dart';
import '../../config/colors.config.dart';

class Socialsfield extends StatelessWidget {
  final IconData prefixIcon;
  final String hintText;

  Socialsfield({required this.prefixIcon, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(prefixIcon, color: AppColor.main),
          hintText: hintText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.main),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          isDense: true,
          contentPadding: EdgeInsets.all(8),
        ),
      ),
    );
  }
}
