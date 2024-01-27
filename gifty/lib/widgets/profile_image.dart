import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';
import '../config/assets.config.dart';

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
      ),
      height: 100,
      width: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(59),
        child: Image.network(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            print('Error loading image: $error');
            return Image.asset(
              "assets/images/profile.png",
              fit: BoxFit.cover,
            );
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
