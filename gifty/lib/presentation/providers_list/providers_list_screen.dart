// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gifty/config/assets.config.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/config/font.config.dart';
import 'package:gifty/widgets/back_button.dart';

class ProvidersListPage extends StatelessWidget {
  const ProvidersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: const GoBackButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 21, vertical: 15),
            child: ProvidersList(
              height: 600,
              width: 387,
            ),
          )),
    );
  }
}

class ProvidersList extends StatelessWidget {
  final double height;
  final double width;
  String Item_imagePath = Assets.images.itemImage;
  String Item_name = "Bouquet";
  bool Item_isFavorite = false;
  String Item_description =
      "Lorem ipsum dolor sit amet consectetur. Aliquam amet volutpat in vestibulum bibendum egestas integer nibh..";
  String Provider_imagePath = Assets.images.providerImage;
  String Provider_name = "Flower paradise Event";
  String Provider_storePlace = "Baba hsen, Algiers";
  String Provider_storeName = "Store";

  ProvidersList({required this.height, required this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Container(
              decoration: BoxDecoration(
                color: AppColor.main,
                borderRadius: BorderRadius.circular(20),
              ),
              height: height,
              width: width,
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Providers 🌟",
                          style: AppTextStyles.subtitle.copyWith(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 16,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 2,
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(27)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    //border: border,
                                    borderRadius: BorderRadius.circular(27),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Provider_name,
                                      style: AppTextStyles.text.copyWith(
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
                                            style: AppTextStyles.text.copyWith(
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
                                            style: AppTextStyles.text.copyWith(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        Opacity(
                                          opacity: 0.7,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 4),
                                            child: Text(
                                              Provider_storeName,
                                              style:
                                                  AppTextStyles.text.copyWith(
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
                                  backgroundColor: AppColor.greenLighter,
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
              )),
          SizedBox(height: 5)
        ]);
  }
}
