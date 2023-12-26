// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';

class UploadImage extends StatelessWidget {
  final String imagePath;
  double height;
  double width;
  VoidCallback edit;

  UploadImage({
    required this.imagePath,
    this.height = 100,
    this.width = 100,
    required this.edit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColor.main,
          borderRadius: BorderRadius.circular(59),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        height: height,
        width: width,
        child: Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            icon: Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: AppColor.greenMain,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.add_a_photo_rounded,
                  color: AppColor.peachLightest,
                )),
            onPressed: edit,
          ),
        ));
  }
}
