import 'package:flutter/material.dart';
import 'package:gifty/config/font.config.dart';
import 'package:gifty/widgets/fields/socials_field.dart';
import 'package:gifty/widgets/profile_image_setup.dart';
import 'package:social_media_flutter/social_media_flutter.dart';

import '../../../config/assets.config.dart';
import '../../../config/colors.config.dart';
import '../../../widgets/background_image.dart';
import '../../../widgets/rounded_container.dart';

class signupProviderFinal extends StatelessWidget {
  const signupProviderFinal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        imagePathTopRight: Assets.images.flowersUpper,
        imagePathBottomLeft: Assets.images.flowersLower,
        logoPath: Assets.images.mainLogo,
        logoTop: 50,
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .2,
                  left: MediaQuery.of(context).size.width * .08),
              child: RoundedContainer(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(height: 10),
                  ProfileImageSetup(hintText: "please upload ur brand logo"),
                  SizedBox(height: 10),
                  Text(
                    "Enter your social media",
                    style: AppTextStyles.Hello,
                  ),
                  SizedBox(height: 10),
                  Socialsfield(
                      prefixIcon: Icons.facebook, hintText: "Facebook Link"),
                  SizedBox(height: 10),
                  Socialsfield(prefixIcon: Icons.web, hintText: "website Link"),
                  SizedBox(height: 10),
                  Socialsfield(
                      prefixIcon: SocialIconsFlutter.instagram,
                      hintText: "Instagram Link"),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
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
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
