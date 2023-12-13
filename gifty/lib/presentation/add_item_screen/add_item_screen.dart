// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../config/assets.config.dart';
import '../../config/colors.config.dart';
import '../../controllers/add_item_controller.dart';
import '../../widgets/bottomSheet.dart';
import 'colors_input.dart';
import 'continue_add_screen.dart';

class AddItemScreen extends StatefulWidget {
  AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _tx_name_controller = TextEditingController();

  final _tx_description_controller = TextEditingController();

  final _tx_price_controller = TextEditingController();

  final AddItemController controller = Get.put(AddItemController());

  List<Map<String, dynamic>> imagesItems = [];

  String iconPicture = Assets.images.iconPicture;

  String iconDropdown = Assets.images.iconDropdown;

  final picker = ImagePicker();

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
                      child: InkWell(
                        // onTap: () {
                        //   showModalBottomSheet(
                        //     context: context,
                        //     builder: ((builder) => BottomSheetWidget(picker)),
                        //   );
                        // },
                        onTap: () async {
                          XFile? selectedImage = await showModalBottomSheet(
                            context: context,
                            builder: ((builder) => BottomSheetWidget(picker)),
                          );
                          if (selectedImage != null) {
                            setState(() {
                              if (imagesItems.length < 5) {
                                // imageList.add(XFile(selectedImage.path));
                                imagesItems.add({
                                  'type': 'file',
                                  'imagePath': selectedImage.path
                                });
                              } else {
                                // imageList[4] = (XFile(selectedImage.path));
                                imagesItems[4]['imagePath'] =
                                    selectedImage.path;
                              }
                            });
                          } else {
                            // User cancelled the picker
                          }
                        },

                        child: (imagesItems.length > 4 &&
                                imagesItems[4]['imagePath'] != null)
                            ? Container(
                                height: size.height * 0.2,
                                width: size.width * 0.6,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(
                                        File(imagesItems[4]['imagePath'])),
                                    fit: BoxFit.contain,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ))
                            : Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 23, vertical: 23),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: 65,
                                          width: 66,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 19, vertical: 22),
                                          decoration: BoxDecoration(
                                              color: AppColor.greenLighter,
                                              borderRadius:
                                                  BorderRadius.circular(37),
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
                                    ])),
                      ))),
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
                        padding: EdgeInsets.all(1),
                        strokeWidth: 3,
                        radius: Radius.circular(20),
                        borderType: BorderType.RRect,
                        dashPattern: [6, 6],
                        child: InkWell(
                          onTap: () async {
                            XFile? selectedImage = await showModalBottomSheet(
                              context: context,
                              builder: ((builder) => BottomSheetWidget(picker)),
                            );
                            if (selectedImage != null) {
                              setState(() {
                                if (imagesItems.length < 4) {
                                  imagesItems.add({
                                    'type': 'file',
                                    'imagePath': selectedImage.path
                                  });
                                } else {
                                  imagesItems[3]['imagePath'] =
                                      selectedImage.path;
                                }
                              });
                            } else {
                              // User cancelled the picker
                            }
                          },
                          child: Container(
                            decoration: (imagesItems.length > 3 &&
                                    imagesItems[3]['imagePath'] != null)
                                ? BoxDecoration(
                                    image: DecorationImage(
                                      image: FileImage(
                                          File(imagesItems[3]['imagePath'])),
                                      fit: BoxFit.contain,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  )
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                            height: 60,
                            width: 80,
                          ),
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
                        padding: EdgeInsets.all(1),
                        strokeWidth: 3,
                        radius: Radius.circular(20),
                        borderType: BorderType.RRect,
                        dashPattern: [6, 6],
                        child: InkWell(
                          onTap: () async {
                            XFile? selectedImage = await showModalBottomSheet(
                              context: context,
                              builder: ((builder) => BottomSheetWidget(picker)),
                            );
                            if (selectedImage != null) {
                              setState(() {
                                if (imagesItems.length < 3) {
                                  // imageList.add(XFile(selectedImage.path));
                                  imagesItems.add({
                                    'type': 'file',
                                    'imagePath': selectedImage.path
                                  });
                                } else {
                                  imagesItems[2]['imagePath'] =
                                      selectedImage.path;
                                }
                              });
                            } else {
                              // User cancelled the picker
                            }
                          },
                          child: Container(
                            decoration: (imagesItems.length > 2 &&
                                    imagesItems[1]['imagePath'] != null)
                                ? BoxDecoration(
                                    image: DecorationImage(
                                      image: FileImage(
                                          File(imagesItems[2]['imagePath'])),
                                      fit: BoxFit.contain,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  )
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                            height: 60,
                            width: 80,
                          ),
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
                        padding: EdgeInsets.all(1),
                        strokeWidth: 3,
                        radius: Radius.circular(20),
                        borderType: BorderType.RRect,
                        dashPattern: [6, 6],
                        child: InkWell(
                          onTap: () async {
                            XFile? selectedImage = await showModalBottomSheet(
                              context: context,
                              builder: ((builder) => BottomSheetWidget(picker)),
                            );
                            if (selectedImage != null) {
                              setState(() {
                                if (imagesItems.length < 2) {
                                  imagesItems.add({
                                    'type': 'file',
                                    'imagePath': selectedImage.path
                                  });
                                } else {
                                  imagesItems[1]['imagePath'] =
                                      selectedImage.path;
                                }
                              });
                            } else {
                              // User cancelled the picker
                            }
                          },
                          child: Container(
                            decoration: (imagesItems.length > 1 &&
                                    imagesItems[1]['imagePath'] != null)
                                ? BoxDecoration(
                                    image: DecorationImage(
                                      image: FileImage(
                                          File(imagesItems[1]['imagePath'])),
                                      fit: BoxFit.contain,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  )
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                            height: 60,
                            width: 80,
                          ),
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
                        padding: EdgeInsets.all(1),
                        strokeWidth: 3,
                        radius: Radius.circular(20),
                        borderType: BorderType.RRect,
                        dashPattern: [6, 6],
                        child: InkWell(
                          onTap: () async {
                            XFile? selectedImage = await showModalBottomSheet(
                              context: context,
                              builder: ((builder) => BottomSheetWidget(picker)),
                            );
                            if (selectedImage != null) {
                              setState(() {
                                if (imagesItems.length < 1) {
                                  // imageList.add(XFile(selectedImage.path));
                                  imagesItems.add({
                                    'type': 'file',
                                    'imagePath': selectedImage.path
                                  });
                                } else {
                                  // imageList[4] = (XFile(selectedImage.path));
                                  imagesItems[0]['imagePath'] =
                                      selectedImage.path;
                                }
                              });
                            } else {
                              // User cancelled the picker
                            }
                          },
                          child: Container(
                            decoration: (imagesItems.length > 0 &&
                                    imagesItems[0]['imagePath'] != null)
                                ? BoxDecoration(
                                    image: DecorationImage(
                                      image: FileImage(
                                          File(imagesItems[0]['imagePath'])),
                                      fit: BoxFit.contain,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  )
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                            height: 60,
                            width: 80,
                          ),
                        )),
                  ),
                ],
              ),
              SizedBox(height: 30),
              _NameFormField(context, _tx_name_controller),
              SizedBox(height: 10),
              _DescriptionFormField(context, _tx_description_controller),
              SizedBox(height: 10),
              _PriceFormField(context, _tx_price_controller),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ColorsInput(),
              ),
              SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child:
                    // Obx(() =>
                    AddButton(context, {
                  'name': _tx_name_controller.text,
                  'description': _tx_description_controller.text,
                  'price': _tx_price_controller.text,
                  'provider_id': 1,
                  'images': imagesItems,
                  'colors': controller.colors
                }),
                // )
              ),
            ])),
      ),
      // bottomNavigationBar: _buildBottomBar(context),
    ));
  }
}

Widget _NameFormField(BuildContext context, controller) {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: TextFormField(
      controller: controller,
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

Widget _DescriptionFormField(BuildContext context, controller) {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: TextFormField(
      controller: controller,
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

Widget _PriceFormField(BuildContext context, controller) {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: TextFormField(
      controller: controller,
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
    onPressed: () {
      // Map<String, dynamic> productData = {
      //                       'name': _tx_name_controller.text,
      //                       'description': _tx_description_controller.text,
      //                       'price': _tx_price_controller.text,
      //                       'provider_id': 1,
      //                       'images': imageList,
      //                     };
      print(
          "Here is the data::::::::::::::::::::::::::::::::::: ${productData}");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ContinueAddScreen(productData: productData),
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

// onPressed: () async {
//                           Map<String, dynamic> productData = {
//                             'name': _tx_name_controller.text,
//                             'description': _tx_description_controller.text,
//                             'price': _tx_price_controller.text,
//                             'provider_id': 1,
//                             'images': imageList,
//                           };
//                           //do processing with this data
//                           print("Here is the data ${productData}");
//                           await DBGift.insertRecord(productData);
//                           //  Navigator.of(context).pushNamed("/historyProduct");
//                         },
