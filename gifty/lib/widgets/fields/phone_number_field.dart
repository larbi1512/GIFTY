import 'package:flutter/material.dart';
import '../../config/colors.config.dart';

class PhoneNumberField extends StatelessWidget {
final TextEditingController controller; 

  PhoneNumberField({required this.controller});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: controller, 
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(Icons.phone_enabled_rounded, color: AppColor.main),
          hintText: 'Phone number ',
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
