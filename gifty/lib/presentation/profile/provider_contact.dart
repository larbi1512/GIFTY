import 'package:flutter/material.dart';

import '../../config/assets.config.dart';
import '../../config/font.config.dart';
import '../../widgets/background_image_no_logo.dart';
import '../../widgets/back_button.dart';
import '../../widgets/items_row.dart';
import '../../widgets/profile_image.dart';
import '../../widgets/white_blurry_background.dart';

class ProviderContact extends StatefulWidget {
  const ProviderContact({super.key});

  @override
  State<ProviderContact> createState() => _ProviderContact();
}

class _ProviderContact extends State<ProviderContact> {
  static List<Map> providersInfo = [
    {
      'Shop_imagePath': Assets.images.providerImage,
      'Shop_name': "Blossom flower shop",
      'Shop_type': 'flower shop',
      'Shop_email': 'nihel.hocine@gmail.com ',
      'Shop_phone': '05 67 90 00 02',
      'Shop_insta': 'blossom_flower',
      'Shop_facebook': 'blossom_flower',
      'Shop_website': 'blossom_flower',
    },
    {
      'Shop_imagePath': Assets.images.providerImage,
      'Shop_name': "Blossom flower shop",
      'Shop_type': 'flower shop',
      'Shop_email': 'nihel.hocine@gmail.com ',
      'Shop_phone': '05 67 90 00 02',
      'Shop_insta': 'blossom_flower',
      'Shop_facebook': 'blossom_flower',
      'Shop_website': 'blossom_flower',
    },
    {
      'Shop_imagePath': Assets.images.providerImage,
      'Shop_name': "Blossom flower shop",
      'Shop_type': 'flower shop',
      'Shop_email': 'nihel.hocine@gmail.com ',
      'Shop_phone': '05 67 90 00 02',
      'Shop_insta': 'blossom_flower',
      'Shop_facebook': 'blossom_flower',
      'Shop_website': 'blossom_flower',
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
  String Shop_imagePath = providersInfo[0]['Shop_imagePath'];
  String Shop_name = providersInfo[0]['Shop_name'];
  String Shop_type = providersInfo[0]['Shop_type'];
  String Shop_email = providersInfo[0]['Shop_email'];
  String Shop_phone = providersInfo[0]['Shop_phone'];
  String Shop_insta = providersInfo[0]['Shop_insta'];
  String Shop_facebook = providersInfo[0]['Shop_facebook'];
  String Shop_website = providersInfo[0]['Shop_website'];

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
                                                imagePath: Shop_imagePath),
                                            SizedBox(width: 5),
                                            Align(
                                                alignment: Alignment.center,
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(Shop_name,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          style: AppTextStyles
                                                              .interTitle),
                                                      SizedBox(height: 5),
                                                      Text(
                                                        Shop_type,
                                                        style: AppTextStyles
                                                            .interSubitle,
                                                      )
                                                    ]))
                                          ])),
                                  SizedBox(height: 25),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 6),
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
                                                  Shop_email,
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
                                                  Shop_phone,
                                                  style: AppTextStyles
                                                      .interSubitle
                                                      .copyWith(
                                                    color: Color(0X8F263238),
                                                  ),
                                                ))
                                          ])),
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
                                              Shop_insta,
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
                                              Shop_facebook,
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
                                              Shop_website,
                                              style: AppTextStyles.interSubitle
                                                  .copyWith(
                                                color: Color(0X8F263238),
                                              ),
                                            ))
                                      ])),
                                  SizedBox(height: 20),

                                  //********************************************** */
                                  Container(
                                      margin: EdgeInsets.only(left: 6),
                                      decoration: BoxDecoration(),
                                      child: Text("Popular items : ",
                                          style: AppTextStyles.interTitle)),
                                  ItemsRow(
                                    items: items,
                                  ),
                                ])))))));
  }
}