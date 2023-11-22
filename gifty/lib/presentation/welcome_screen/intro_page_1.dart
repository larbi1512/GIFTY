import 'package:flutter/material.dart';
import 'package:gifty/config/assets.config.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/config/font.config.dart';

class IntroPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.main,
      //add picture + description text in center
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.sendGift,
            height: 300,
            width: 300,
          ),
          
          Text(
            'Dive into a world of curated wonders, where every gift tells a story and every bloom whispers sentiments.',
          style: AppTextStyles.Onboardingdescription,
          textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

