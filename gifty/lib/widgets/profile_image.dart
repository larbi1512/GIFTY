import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';

class ProfileImage extends StatelessWidget {
  final String imagePath;

  const ProfileImage({
    required this.imagePath,
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
      height: 100,
      width: 100,
    );
  }
}
