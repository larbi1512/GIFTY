import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/config/font.config.dart';

import '../../../config/assets.config.dart';
import '../../../widgets/background_image.dart';
import '../../../widgets/rounded_container.dart';
import '../../../widgets/toggle_button.dart';

class signup1 extends StatefulWidget {
   @override
  _Signup1State createState() => _Signup1State();
}
  
  class _Signup1State extends State<signup1> {
  bool isUserSelected = true;

  void toggleCallback(bool selected) {
    setState(() {
      isUserSelected = selected;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        imagePathTopRight: Assets.images.flowersUpper,
        imagePathBottomLeft: Assets.images.flowersLower,
        logoPath: Assets.images.mainLogo,
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .25, left: MediaQuery.of(context).size.width * .08),
                child: RoundedContainer(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Sign Up',
                          style: AppTextStyles.loginText,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'join to find your favorite flowers and gifts',
                          style: AppTextStyles.text,
                        ),
                      ),
                      SizedBox(height: 20),
                      ToggleButton(
                        onToggle: toggleCallback,
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.email_rounded, color: AppColor.main),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Email',
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: AppColor.main),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon:
                                Icon(Icons.lock_rounded, color: AppColor.main),
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.visibility_off_rounded),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: AppColor.main),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon:
                                Icon(Icons.lock_rounded, color: AppColor.main),
                            hintText: 'Confirm Password',
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.visibility_off_rounded),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: AppColor.main),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColor.mainLighter,
                          onPrimary: Colors.white,
                          minimumSize: Size(250, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                             if (isUserSelected) {
                          Navigator.pushNamed(context, '/signup_user');
                        } else {
                          Navigator.pushNamed(context, '/signup_provider');
                        }
                          
                        },
                        child: Text('Next'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? ',
                              style: AppTextStyles.loginText2,
                            ),
                            Text(
                              'Login here',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColor.main,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
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
