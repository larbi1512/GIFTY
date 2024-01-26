import 'package:flutter/material.dart';
import '../../config/assets.config.dart';
import '../../config/colors.config.dart';
import '../../config/font.config.dart';
import '../../widgets/background_image_no_logo.dart';
import '../../widgets/white_blurry_background.dart';
import '../../widgets/searchPageWidgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
                            height: mediaQueryData.size.height * 0.78,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Here is where you can do some ",
                                    style: AppTextStyles.interTitle.copyWith(
                                        fontSize: 18,
                                        color: AppColor.mainLighter),
                                  ),
                                  Row(children: [
                                    Text(
                                      "magic with",
                                      style: AppTextStyles.interTitle.copyWith(
                                          fontSize: 18,
                                          color: AppColor.mainLighter),
                                    ),
                                    Text(
                                      " GIFTY 🪄",
                                      style: AppTextStyles.interTitle.copyWith(
                                        fontSize: 19,
                                      ),
                                    ),
                                  ]),
                                  Text(
                                    "Choose the tags to search with",
                                    style: AppTextStyles.interSubitle.copyWith(
                                      color: Color(0X8F263238),
                                      fontSize: 13,
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          SearchWidget("Event type", false),
                                          SearchWidget(
                                              "Gift’s receiver", false),
                                          SearchWidget("prefered color", false),
                                          SearchWidget("Receiver’s age", false),
                                          SearchWidget("Additional tags", true),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: mediaQueryData.size.height * 0.07,
                                      width: mediaQueryData.size.width * 0.9,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 0),
                                          elevation: 4,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: AppColor.main),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Search  ",
                                              style: AppTextStyles.interSubitle
                                                  .copyWith(
                                                color: AppColor.main,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      Assets.images.iconMagic),
                                                  fit: BoxFit.none,
                                                ),
                                              ),
                                              height: 30,
                                              width: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ])))))));
  }
}
