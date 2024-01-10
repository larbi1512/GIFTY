
import 'package:flutter/material.dart';

import '../../config/colors.config.dart';

class UsernameField extends StatelessWidget {
  final String hintText; 
  final TextEditingController controller; 

  UsernameField(
      {required this.hintText, required this.controller}); 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon:
              Icon(Icons.person_add_alt_1_rounded, color: AppColor.main),
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
