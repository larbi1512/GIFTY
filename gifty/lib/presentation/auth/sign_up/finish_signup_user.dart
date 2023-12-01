import 'package:flutter/material.dart';
import 'package:gifty/config/font.config.dart';

import '../../../config/assets.config.dart';
import '../../../widgets/Profile_image.dart';
import '../../../widgets/background_image.dart';

class signupUserfinal extends StatelessWidget {
  const signupUserfinal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        imagePathTopRight: Assets.images.flowersUpper,
        imagePathBottomLeft: Assets.images.flowersLower,
        logoPath: Assets.images.mainLogo,
        logoTop: 25,
        logoRight: 25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              child: Padding(
                padding: const EdgeInsets.only(top: 150, left: 8.0),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        'hello, soumia',
                        style: AppTextStyles.Hello,
                        //add alignment
                      
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(height:40),
                    Center(
                      child: ProfileImage(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
