import 'package:flutter/material.dart';
import 'package:gifty/config/assets.config.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/config/font.config.dart';

class IntroPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.main,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.images.sendGiftRafiki,
          height: 300,
          width: 300,
        ),
        Text(
          'Immerse yourself in the symphony of exquisite gifts and flowers. With each interaction, you unravel a tapestry of possibilities. Explore the seamless fusion of elegance and thoughtfulness at GIFTY.',
          style: AppTextStyles.Onboardingdescription,
          textAlign: TextAlign.center,
        ),
      ],
    ),
    );
  }
}
