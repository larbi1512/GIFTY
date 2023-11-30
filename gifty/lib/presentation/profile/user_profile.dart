import 'package:flutter/material.dart';

import '../../config/assets.config.dart';
import '../../config/colors.config.dart';
import '../../config/font.config.dart';
import '../../widgets/background_image_no_logo.dart';
import '../../widgets/back_button.dart';
import '../../widgets/items_row.dart';
import '../../widgets/profile_image.dart';
import '../../widgets/white_blurry_background.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  static List<Map> usersInfo = [
    {
      'User_imagePath': Assets.images.userImage,
      'User_name': "Aya Bouaouina",
      'User_surname': 'Ayou',
      'User_email': 'nihel.hocine@gmail.com ',
      'User_phone': '05 67 90 00 02',
      'User_insta': 'blossom_flower',
      'User_facebook': 'blossom_flower',
      'User_website': 'blossom_flower',
    },
    {
      'User_imagePath': Assets.images.userImage,
      'User_name': "Aya Bouaouina",
      'User_surname': 'Ayou',
      'User_email': 'nihel.hocine@gmail.com ',
      'User_phone': '05 67 90 00 02',
      'User_insta': 'blossom_flower',
      'User_facebook': 'blossom_flower',
      'User_website': 'blossom_flower',
    },
    {
      'User_imagePath': Assets.images.userImage,
      'User_name': "Aya Bouaouina",
      'User_surname': 'Ayou',
      'User_email': 'nihel.hocine@gmail.com ',
      'User_phone': '05 67 90 00 02',
      'User_insta': 'blossom_flower',
      'User_facebook': 'blossom_flower',
      'User_website': 'blossom_flower',
    },
  ];

  static List<Map> items = [
    {
      'Item_imagePath': Assets.images.itemImage,
      'Item_name': "Bouquet",
      'Item_isFavorite': false,
      'Item_description':
          "Lorem ipsum dolor sit amet consectetur. Aliquam amet volutpat in vestibulum bibendum egestas integer nibh..",
    },
    {
      'Item_imagePath': Assets.images.itemImage,
      'Item_name': "Bouquet",
      'Item_isFavorite': false,
      'Item_description':
          "Lorem ipsum dolor sit amet consectetur. Aliquam amet volutpat in vestibulum bibendum egestas integer nibh..",
    },
    {
      'Item_imagePath': Assets.images.itemImage,
      'Item_name': "Bouquet",
      'Item_isFavorite': false,
      'Item_description':
          "Lorem ipsum dolor sit amet consectetur. Aliquam amet volutpat in vestibulum bibendum egestas integer nibh..",
    },
  ];

  String Item_imagePath = Assets.images.itemImage;
  String Item_name = "Bouquet";
  bool Item_isFavorite = false;
  String Item_description =
      "Lorem ipsum dolor sit amet consectetur. Aliquam amet volutpat in vestibulum bibendum egestas integer nibh..";
  String User_imagePath = usersInfo[0]['User_imagePath'];
  String User_name = usersInfo[0]['User_name'];
  String User_surname = usersInfo[0]['User_surname'];
  String User_email = usersInfo[0]['User_email'];
  String User_phone = usersInfo[0]['User_phone'];
  String User_insta = usersInfo[0]['User_insta'];
  String User_facebook = usersInfo[0]['User_facebook'];
  String User_website = usersInfo[0]['User_website'];

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: BackgroundImageNoLogo(
                imagePathTopRight: Assets.images.flowersUpper,
                imagePathBottomLeft: Assets.images.flowersLower,
                // height: mediaQueryData.size.height,
                // width: double.maxFinite,
                child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: mediaQueryData.size.width * 0.03),
                        child: WhiteBlurryBackground(
                            height: mediaQueryData.size.height * 0.92,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GoBackButton(),
                                  SizedBox(height: 15),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 6, right: 10),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ProfileImage(
                                                imagePath: User_imagePath),
                                            Align(
                                                alignment: Alignment.center,
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(User_name,
                                                          style: AppTextStyles
                                                              .interTitle),
                                                      SizedBox(height: 5),
                                                      Text(
                                                        User_surname,
                                                        style: AppTextStyles
                                                            .interSubitle,
                                                      )
                                                    ]))
                                          ])),
                                  SizedBox(height: 30),
                                  //*************************** */
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 6),
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            "Contact information : ",
                                            style: AppTextStyles.interTitle,
                                          )),
                                      SizedBox(height: 10),
                                      Padding(
                                          padding: EdgeInsets.only(left: 6),
                                          child: Row(children: [
                                            Text("Email :  ",
                                                style:
                                                    AppTextStyles.interSubitle),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 12),
                                                child: Text(
                                                  User_email,
                                                  style: AppTextStyles
                                                      .interSubitle
                                                      .copyWith(
                                                    color: Color(0X8F263238),
                                                  ),
                                                ))
                                          ])),
                                      SizedBox(height: 5),
                                      Padding(
                                          padding: EdgeInsets.only(left: 6),
                                          child: Row(children: [
                                            Text(
                                              "Phone number :  ",
                                              style: AppTextStyles.interSubitle,
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 12),
                                                child: Text(
                                                  User_phone,
                                                  style: AppTextStyles
                                                      .interSubitle
                                                      .copyWith(
                                                    color: Color(0X8F263238),
                                                  ),
                                                ))
                                          ])),
                                      // SizedBox(height: 20),
                                      // Align(
                                      //   alignment: Alignment.topLeft,
                                      //   child: Container(
                                      //     height: 35,
                                      //     width: 85,
                                      //     child: ElevatedButton(
                                      //       style: ElevatedButton.styleFrom(
                                      //         backgroundColor:
                                      //             AppColor.greenLighter,
                                      //         padding:
                                      //             const EdgeInsets.symmetric(
                                      //                 horizontal: 5,
                                      //                 vertical: 0),
                                      //       ),
                                      //       onPressed: () {},
                                      //       child: Text(
                                      //         "Edit",
                                      //         style:
                                      //             AppTextStyles.text.copyWith(
                                      //           color: Colors.white,
                                      //           fontSize: 12,
                                      //           fontWeight: FontWeight.bold,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      SizedBox(height: 25),
                                    ],
                                  ),

                                  Container(
                                      margin: EdgeInsets.only(left: 6),
                                      decoration: BoxDecoration(),
                                      child: Text("Social Media : ",
                                          style: AppTextStyles.interTitle)),
                                  SizedBox(height: 10),
                                  Padding(
                                      padding: EdgeInsets.only(left: 6),
                                      child: Row(children: [
                                        Padding(
                                            padding: EdgeInsets.only(bottom: 1),
                                            child: Text(
                                              "instagram :  ",
                                              style: AppTextStyles.interSubitle,
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(left: 12),
                                            child: Text(
                                              User_insta,
                                              style: AppTextStyles.interSubitle
                                                  .copyWith(
                                                color: Color(0X8F263238),
                                              ),
                                            ))
                                      ])),
                                  SizedBox(height: 5),
                                  Padding(
                                      padding: EdgeInsets.only(left: 6),
                                      child: Row(children: [
                                        Text(
                                          "Facebook :  ",
                                          style: AppTextStyles.interSubitle,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(left: 13),
                                            child: Text(
                                              User_facebook,
                                              style: AppTextStyles.interSubitle
                                                  .copyWith(
                                                color: Color(0X8F263238),
                                              ),
                                            ))
                                      ])),
                                  SizedBox(height: 5),
                                  Padding(
                                      padding: EdgeInsets.only(left: 6),
                                      child: Row(children: [
                                        Text(
                                          "Website :  ",
                                          style: AppTextStyles.interSubitle,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(left: 13),
                                            child: Text(
                                              User_website,
                                              style: AppTextStyles.interSubitle
                                                  .copyWith(
                                                color: Color(0X8F263238),
                                              ),
                                            ))
                                      ])),
                                  SizedBox(height: 20),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      height: 35,
                                      width: 85,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColor.greenLighter,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 0),
                                        ),
                                        onPressed: () {},
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
                                      decoration: BoxDecoration(),
                                      child: Text("Likes : ",
                                          style: AppTextStyles.interTitle)),
                                  SizedBox(height: 5),
                                  ItemsRow(
                                    items: items,
                                  ),
                                ])))))));
  }
}
