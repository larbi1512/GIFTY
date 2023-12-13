import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/config/font.config.dart';
import 'package:gifty/widgets/fields/phone_number_field.dart';
import 'package:gifty/widgets/fields/username_field.dart';
import 'package:gifty/widgets/fields/wilaya_field.dart';
import '../../../config/assets.config.dart';
import '../../../widgets/background_image.dart';
import '../../../widgets/rounded_container.dart';

class signupUser extends StatelessWidget {
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
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .25,
                  left: MediaQuery.of(context).size.width * .08),
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
                    //add two textFields in a row
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .35,
                          padding: EdgeInsets.only(left: 20, ),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person_2_rounded,
                                  color: AppColor.main),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Name',
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.main),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                          
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .35,
                          padding: EdgeInsets.only(
                            right: 10,
                            left : 5,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person_2_rounded,
                                  color: AppColor.main),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Surname',
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.main),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(4),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                     UsernameField(hintText: "enter your username"),
                      SizedBox(height: 10,),
                      WilayaField(),
                      SizedBox(height: 10,),
                      PhoneNumberField(),
                      SizedBox(height: 30,),
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
                        Navigator.pushReplacementNamed(context, '/finish_signup_user');
                      },
                      child: Text('Sign up'),
                    ),
                    SizedBox(height: 20,),

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
