import 'package:flutter/material.dart';
import 'package:gifty/config/assets.config.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/config/font.config.dart';

class IntroPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.main,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.valentineBouquet,
            height: 250,
            width: 250,
          ),
          Text(
            'At GIFTY, we believe in the power of personal touches. Elevate your gifting experience by adding your unique flair. Craft moments that linger and capture hearts that matter. It is not just a gift; it is your signature on a moment. ',
            style: AppTextStyles.Onboardingdescription,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
