import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gifty/widgets/back_button.dart';

import '../../config/assets.config.dart';
import '../../config/colors.config.dart';
import '../../config/font.config.dart';

class ContinueAddScreen extends StatelessWidget {
  String iconPicture = Assets.images.iconPicture;
  String iconDropdown = Assets.images.iconDropdown;

  ContinueAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColor.peachLightest,
            appBar: AppBar(
              title: const Text(
                'Add New Item',
              ),
              centerTitle: true,
              titleTextStyle: AppTextStyles.interHeading,
              elevation: 0,
              backgroundColor: AppColor.peachLightest,
              leading:
                  Container(padding: EdgeInsets.all(8), child: GoBackButton()),
            ),
            body: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppColor.mainLighter,
                      width: 1,
                    ),
                  ),
                ),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                              width: size.width * 0.48,
                              child: Divider(
                                color: AppColor.greenLighter,
                                indent: 0,
                                thickness: 3,
                              ))),
                      Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                              width: size.width * 0.48,
                              child: Divider(
                                color: AppColor.greenMain,
                                endIndent: 0,
                                thickness: 3,
                              ))),
                    ],
                  ),
                  SizedBox(height: 30),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Choose the tags you want to be found in the search:",
                        style: AppTextStyles.interSubitle.copyWith(
                          color: Color(0X7F263238),
                          fontSize: 15,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: AddButton(context),
                  ),
                ]))));
  }
}

Widget AddButton(BuildContext context) {
  return OutlinedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColor.mainLighter),
      side: MaterialStateProperty.all(BorderSide(
        color: AppColor.main,
        width: 1,
      )),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      )),
    ),
    onPressed: () {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Continue Add Product",
          style: TextStyle(
            color: AppColor.peachLightest,
            fontSize: 15,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
