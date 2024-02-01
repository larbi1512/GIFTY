import 'package:flutter/material.dart';
import 'package:gifty/config/assets.config.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/config/font.config.dart';
import 'package:gifty/providers/id_provider.dart';
import 'package:gifty/widgets/background_image_no_logo.dart';
import 'package:gifty/widgets/profile_image.dart';
import 'package:gifty/widgets/white_blurry_background.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserProfile extends StatefulWidget {
   final IdProvider idProvider = IdProvider();

  UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String User_imagePath = "";
  String User_name = "";
  String User_surname = "";
  String User_email = "";
  String User_phone = "";

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    // Dummy data
    final dummyUserData = {
      'name': 'Larvi',
      'surname': 'larbi',
      'email': 'hello123@gmail.com',
      'phone_number': '0553988691',
      // Add other fields as needed
    };

    // Simulate a delay to mimic network request
    await Future.delayed(Duration(seconds: 2));

    // Set the dummy data
    setState(() {
      User_name = dummyUserData['name']!;
      User_surname = dummyUserData['surname']!;
      User_email = dummyUserData['email']!;
      User_phone = dummyUserData['phone_number']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: BackgroundImageNoLogo(
          imagePathTopRight: Assets.images.flowersUpper,
          imagePathBottomLeft: Assets.images.flowersLower,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mediaQueryData.size.width * 0.03,
              ),
              child: WhiteBlurryBackground(
                height: mediaQueryData.size.height * 0.77,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 6, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ProfileImage(imagePath: User_imagePath),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(User_name,
                                    style: AppTextStyles.interTitle),
                                SizedBox(height: 5),
                                Text(User_surname,
                                    style: AppTextStyles.interSubitle),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 6),
                          child: Text(
                            "Contact information : ",
                            style: AppTextStyles.interTitle,
                          ),
                        ),
                        SizedBox(height: 10),
                        // Display Email if available
                        Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Row(
                            children: [
                              Text("Email :  ",
                                  style: AppTextStyles.interSubitle),
                              Padding(
                                padding: EdgeInsets.only(left: 1),
                                child: Text(
                                  User_email,
                                  style: AppTextStyles.interSubitle.copyWith(
                                    color: Color(0X8F263238),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Display Phone number if available
                        Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Row(
                            children: [
                              Text("Phone number :  ",
                                  style: AppTextStyles.interSubitle),
                              Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Text(
                                  User_phone,
                                  style: AppTextStyles.interSubitle.copyWith(
                                    color: Color(0X8F263238),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25),
                      ],
                    ),
                    SizedBox(height: 10),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 35,
                        width: 85,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.greenLighter,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 0,
                            ),
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //   //   builder: (context) =>
                            //   //       // EditProfile(name: User_name),
                            //   // ),
                            // );
                          },
                          child: Text(
                            "Edit",
                            style: AppTextStyles.text.copyWith(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      margin: EdgeInsets.only(left: 6),
                      child: Text(
                        "Likes : ",
                        style: AppTextStyles.interTitle,
                      ),
                    ),
                    SizedBox(height: 5),
                    // ItemsRow(items: items),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
