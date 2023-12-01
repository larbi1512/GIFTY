import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gifty/widgets/rounded_container.dart';
import '../config/colors.config.dart';

class CategoryDropdown extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onChanged;

  CategoryDropdown({
    required this.categories,
    required this.selectedCategory,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),

          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.all(Radius.circular(25)),
            border: Border.all(color: AppColor.main, width: 1),
            

          ),
          child: DropdownButton<String>(
            dropdownColor: AppColor.main,
            iconEnabledColor: AppColor.main,
            isExpanded: true,
            
            style: TextStyle(color: Colors.black),
            value: selectedCategory,
            onChanged: (String? newValue) {
              if (newValue != null) {
                onChanged(newValue);
              }
            },
            items: categories.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: Colors.black87),
                ),
              );
            }).toList(),
          ),
        ),
      ],
      ) ,
    );
  }
}
