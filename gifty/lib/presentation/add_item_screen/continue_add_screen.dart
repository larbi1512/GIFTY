// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gifty/presentation/home/homeScreen.dart';
import 'package:gifty/widgets/back_button.dart';

import '../../config/assets.config.dart';
import '../../config/colors.config.dart';
import '../../config/font.config.dart';
import '../../controllers/navbar_controller.dart';
import '../../databases/DBGift.dart';

class ContinueAddScreen extends StatelessWidget {
  String iconPicture = Assets.images.iconPicture;
  String iconDropdown = Assets.images.iconDropdown;
  Map<String, dynamic> productData;

  ContinueAddScreen({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
          leading: Container(padding: EdgeInsets.all(8), child: GoBackButton()),
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
              // Expanded(
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         // SearchWidget("Event type :", false),
              //         // SearchWidget("Age :", false),
              //         // SearchWidget("Position :", false),
              //         SizedBox(height: 20),
              //         Align(
              //             alignment: Alignment.centerLeft,
              //             child: Padding(
              //                 padding: EdgeInsets.only(left: 30),
              //                 child: Text(
              //                   "Add your tags here",
              //                   style: TextStyle(
              //                     fontSize: 14,
              //                     fontFamily: 'Poppins',
              //                     fontWeight: FontWeight.w600,
              //                   ),
              //                 ))),
              //         SearchWidget("Additional tags : ", true),
              //       ],
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: AddButton(context, productData),
              ),
            ])));
  }
}

Widget AddButton(BuildContext context, Map<String, dynamic> productData) {
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
    onPressed: () async {
      print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii $productData");
      await DBGift.insertRecord(productData);
      Navigator.pop(context);
      // navBarController.SetPage(1);
      // Navigator.pop(context);
      // Navigator.popUntil(context, ModalRoute.withName('/home'));
      // Navigator.pushNamed(context, '/home');
      // setState(() {});
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Add Product",
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
