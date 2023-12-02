// ignore_for_file: must_be_immutable

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../config/assets.config.dart';
import '../../config/colors.config.dart';
import 'continue_add_screen.dart';

class AddItemScreen extends StatelessWidget {
  String iconPicture = Assets.images.iconPicture;
  String iconDropdown = Assets.images.iconDropdown;

  AddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.peachLightest,
      body: SingleChildScrollView(
        child: Container(
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
                            color: AppColor.greenMain,
                            indent: 0,
                            thickness: 3,
                          ))),
                  Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                          width: size.width * 0.48,
                          child: Divider(
                            color: AppColor.greenLighter,
                            endIndent: 0,
                            thickness: 3,
                          ))),
                ],
              ),
              SizedBox(height: 5),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: DottedBorder(
                      color: AppColor.main,
                      padding: EdgeInsets.all(3),
                      strokeWidth: 3,
                      radius: Radius.circular(20),
                      borderType: BorderType.RRect,
                      dashPattern: [6, 6],
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 23, vertical: 23),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    height: 65,
                                    width: 66,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 19, vertical: 22),
                                    decoration: BoxDecoration(
                                        color: AppColor.greenLighter,
                                        borderRadius: BorderRadius.circular(37),
                                        border: Border.all(
                                            color: AppColor.greenMain)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(iconPicture),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      height: 5,
                                      width: 5,
                                    )),
                                SizedBox(height: 10),
                                Text(
                                  "click to upload up to 5 images",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ])))),
              SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 62,
                    width: 80,
                    padding: EdgeInsets.all(1.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: DottedBorder(
                        color: AppColor.main,
                        padding: EdgeInsets.all(3),
                        strokeWidth: 3,
                        radius: Radius.circular(20),
                        borderType: BorderType.RRect,
                        dashPattern: [6, 6],
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          height: 60,
                          width: 80,
                        )),
                  ),
                  Container(
                    height: 62,
                    width: 80,
                    padding: EdgeInsets.all(1.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: DottedBorder(
                        color: AppColor.main,
                        padding: EdgeInsets.all(3),
                        strokeWidth: 3,
                        radius: Radius.circular(20),
                        borderType: BorderType.RRect,
                        dashPattern: [6, 6],
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          height: 60,
                          width: 80,
                        )),
                  ),
                  Container(
                    height: 62,
                    width: 80,
                    padding: EdgeInsets.all(1.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: DottedBorder(
                        color: AppColor.main,
                        padding: EdgeInsets.all(3),
                        strokeWidth: 3,
                        radius: Radius.circular(20),
                        borderType: BorderType.RRect,
                        dashPattern: [6, 6],
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          height: 60,
                          width: 80,
                        )),
                  ),
                  Container(
                    height: 62,
                    width: 80,
                    padding: EdgeInsets.all(1.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: DottedBorder(
                        color: AppColor.main,
                        padding: EdgeInsets.all(3),
                        strokeWidth: 3,
                        radius: Radius.circular(20),
                        borderType: BorderType.RRect,
                        dashPattern: [6, 6],
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          height: 60,
                          width: 80,
                        )),
                  ),
                ],
              ),
              SizedBox(height: 30),
              _NameFormField(context),
              SizedBox(height: 10),
              _DescriptionFormField(context),
              SizedBox(height: 10),
              _PriceFormField(context),
              SizedBox(height: 20),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        "Add available colors",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ))),
              SizedBox(height: 2),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: DropDownColors(context),
              ),
              SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: AddButton(context),
              ),
            ])),
      ),
      // bottomNavigationBar: _buildBottomBar(context),
    ));
  }
}

Widget _NameFormField(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: TextFormField(
      // controller: nameController,
      style: TextStyle(
        color: AppColor.main,
        fontSize: 15,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
      keyboardType: TextInputType.text,
      maxLines: 1,
      focusNode: FocusNode(),
      autofocus: true,
      cursorColor: AppColor.main,
      // validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 25),
        fillColor: AppColor.peach,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColor.main,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColor.main,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColor.main,
            width: 1,
          ),
        ),
        hintText: "Name of the product ",
        hintStyle: TextStyle(
          color: AppColor.main,
          fontSize: 15,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}

Widget _DescriptionFormField(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: TextFormField(
      // controller: nameController,
      style: TextStyle(
        color: AppColor.main,
        fontSize: 15,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
      keyboardType: TextInputType.text,
      maxLines: 1,
      focusNode: FocusNode(),
      autofocus: true,
      cursorColor: AppColor.main,
      // validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 25),
        fillColor: AppColor.peach,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColor.main,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColor.main,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColor.main,
            width: 1,
          ),
        ),
        hintText: "Description ",
        hintStyle: TextStyle(
          color: AppColor.main,
          fontSize: 15,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}

Widget _PriceFormField(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: TextFormField(
      // controller: nameController,
      style: TextStyle(
        color: AppColor.main,
        fontSize: 15,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
      keyboardType: TextInputType.text,
      maxLines: 1,
      focusNode: FocusNode(),
      autofocus: true,
      cursorColor: AppColor.main,
      // validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 25),
        fillColor: AppColor.peach,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColor.main,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColor.main,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColor.main,
            width: 1,
          ),
        ),
        hintText: "Price ",
        hintStyle: TextStyle(
          color: AppColor.main,
          fontSize: 15,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}

Widget DropDownColors(BuildContext context) {
  List<Color> dropdownItemList = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.teal,
    Colors.pink,
  ];

  return DropdownButtonFormField(
    items: dropdownItemList.map<DropdownMenuItem<Color>>((Color value) {
      return DropdownMenuItem<Color>(
        value: value,
        child: Container(
          width: 30,
          height: 30,
          color: value,
        ),
      );
    }).toList(),
    onChanged: (value) {},
    decoration: InputDecoration(
      hintText: "Colors",
      hintStyle: TextStyle(
        color: AppColor.main,
        fontSize: 15,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
      isDense: true,
      contentPadding: EdgeInsets.only(left: 25, right: 10, top: 12, bottom: 8),
      fillColor: AppColor.peach,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: AppColor.main,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: AppColor.main,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: AppColor.main,
          width: 1,
        ),
      ),
    ),
  );
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
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ContinueAddScreen(),
        ),
      );
    },
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
