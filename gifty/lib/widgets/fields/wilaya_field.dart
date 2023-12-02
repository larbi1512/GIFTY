import 'package:flutter/material.dart';
import '../../config/colors.config.dart';

class WilayaField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(Icons.place_rounded, color: AppColor.main),
          hintText: 'Wilaya',
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
