import 'package:flutter/material.dart';
import '/config/assets.config.dart';
import '/config/colors.config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/config/font.config.dart';
import '/presentation/card_screen/back_button.dart';

import '../providers_list/providers_list_screen.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  //List <Provider> providers= ;
  //List <Item> Items= ;
  String Item_imagePath = Assets.images.itemImage;
  String Item_name = "Bouquet";
  bool Item_isFavorite = false;
  String Item_description =
      "Lorem ipsum dolor sit amet consectetur. Aliquam amet volutpat in vestibulum bibendum egestas integer nibh..";
  String Provider_imagePath = Assets.images.providerImage;
  String Provider_name = "Flower paradise Event";
  String Provider_storePlace = "Baba hsen, Algiers";
  String Provider_storeName = "Store";

  @override
  Widget build(BuildContext context) {
    // mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
          floatingActionButton: const GoBackButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 21, vertical: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 37),
                    SizedBox(
                        height: 406,
                        width: 387,
                        child:
                            Stack(alignment: Alignment.bottomCenter, children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColor.main,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(Item_imagePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: 510,
                            width: 387,
                            alignment: Alignment.center,
                          ),
                          ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                colors: [Colors.transparent, Colors.black],
                                stops: [0.2, 0.8],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ).createShader(bounds);
                            },
                            blendMode: BlendMode.dstIn,
                            child: Container(
                              height: 500,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColor.main,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 17, vertical: 29),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 6),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              Item_name,
                                              style: AppTextStyles.subtitle
                                                  .copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  Item_isFavorite =
                                                      !Item_isFavorite;
                                                });
                                                //addToFavorite();
                                              },
                                              child: Icon(
                                                Item_isFavorite
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: Colors.white,
                                              ),
                                            ),

                                            //the icon from figma
                                            // InkWell(
                                            //   onTap: () {
                                            //  setState(() {
                                            //         Item_isFavorite =
                                            //             !Item_isFavorite;
                                            //       });
                                            //       //addToFavorite();
                                            //   },
                                            //   child: Container(
                                            //     padding: EdgeInsets.all(
                                            //         16.0),
                                            //     child: SvgPicture.asset(
                                            //       'assets/images/icons/img_nav_liked.svg',
                                            //       width: 20.0,
                                            //       height: 20.0,
                                            //       fit: BoxFit.cover,
                                            //     ),
                                            //   ),
                                            // ),
                                          ])),
                                  const SizedBox(height: 12),
                                  Container(
                                      width: 282,
                                      margin: const EdgeInsets.only(
                                          left: 6, right: 64),
                                      child: Text(
                                        Item_description,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.text.copyWith(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ))
                                ]),
                          ),
                        ])),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.main,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 216,
                      width: 387,
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Providers 🌟",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Luxembourg',
                                        color:
                                            Colors.white, // or any other color
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProvidersList(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "See all",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Luxembourg',
                                          color: Colors
                                              .white, // or any other color
                                        ),
                                      ),
                                    )
                                  ])),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 2,
                                    vertical: 2,
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(27)),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            //border: border,
                                            borderRadius:
                                                BorderRadius.circular(27),
                                          ),
                                          child: Image.asset(
                                            Provider_imagePath,
                                            height: 47,
                                            width: 47,
                                            fit: BoxFit.cover,
                                            //color: color,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 8,
                                          top: 4,
                                          bottom: 4,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              Provider_name,
                                              style:
                                                  AppTextStyles.text.copyWith(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(height: 1),
                                            Row(
                                              children: [
                                                Opacity(
                                                  opacity: 0.7,
                                                  child: Text(
                                                    Provider_storePlace,
                                                    style: AppTextStyles.text
                                                        .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 1,
                                                    top: 1,
                                                    bottom: 1,
                                                  ),
                                                  child: Text(
                                                    ".",
                                                    style: AppTextStyles.text
                                                        .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                Opacity(
                                                  opacity: 0.7,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 4),
                                                    child: Text(
                                                      Provider_storeName,
                                                      style: AppTextStyles.text
                                                          .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColor.greenLighter,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 0),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "Add",
                                          style: AppTextStyles.text.copyWith(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5)
                  ]))),
    );
  }
}