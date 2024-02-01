import 'package:flutter/material.dart';
import 'package:gifty/config/font.config.dart';
import 'package:gifty/widgets/profile_image_setup.dart';

import '../../../config/assets.config.dart';
import '../../../config/colors.config.dart';
import '../../../widgets/background_image.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupUserFinal extends StatelessWidget {
  const SignupUserFinal({super.key});

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
                        'hello, ',
                        style: AppTextStyles.Hello,
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(height: 40),
                    Center(
                      child: ProfileImageSetup(
                        hintText: "Please upload a profile pic",
                        userId: ModalRoute.of(context)!
                            .settings
                            .arguments
                            .toString(),
                        providerId: "",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColor.peachLighter,
                          onPrimary: AppColor.mainLighter,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Text('Skip'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColor.mainLighter,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Text('Next'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
