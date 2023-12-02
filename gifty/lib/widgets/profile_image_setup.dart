import 'package:flutter/material.dart';
import 'package:gifty/config/font.config.dart';
import 'package:gifty/widgets/bottomSheet.dart';

import '../config/assets.config.dart';
import '../config/colors.config.dart';

class ProfileImageSetup extends StatelessWidget {
  final String hintText;

  ProfileImageSetup({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage(Assets.images.profilePic),
        ),
        SizedBox(height: 20.0),
        Text(
          hintText,
          style: AppTextStyles.Hello,
        ),
        SizedBox(height: 20.0),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: ((builder) => bottomSheet()),
            );
          },
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              color: AppColor.mainLighter,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.all(12),
            child: Icon(
              Icons.add_a_photo_outlined,
              color: Colors.white,
              size: 35.0,
            ),
          ),
        ),
      ],
    );
  }
}
