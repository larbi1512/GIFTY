// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gifty/widgets/back_button.dart';
import '../../config/assets.config.dart';
import '../../config/colors.config.dart';
import '../../config/font.config.dart';
import '../../constants/endpoints.dart';
import '../../controllers/add_item_controller.dart';
import '../../databases/DBGift.dart';
import '../../services/api_service.dart';
import '../../widgets/fields/categoryDropdown.dart';
import '../../widgets/searchPageWidgets.dart';
import 'add_item_screen.dart';

class ContinueAddScreen extends StatefulWidget {
  Map<String, dynamic> productData;
  static final AddItemController addControllers = Get.put(AddItemController());
  ContinueAddScreen({super.key, required this.productData});

  @override
  State<ContinueAddScreen> createState() => _ContinueAddScreenState();
}

class _ContinueAddScreenState extends State<ContinueAddScreen> {
  bool _loading = false;
  // final AddItemController controller = Get.put(AddItemController());
  String iconPicture = Assets.images.iconPicture;
  String iconDropdown = Assets.images.iconDropdown;

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
              SizedBox(height: 15),
              if (_loading)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 150),
                    CircularProgressIndicator(),
                    SizedBox(height: 25),
                    Text(
                      "adding the product, Please wait",
                      style: AppTextStyles.interSubitle.copyWith(
                        color: Color(0X7F263238),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              if (!_loading)
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Choose the ",
                            style: AppTextStyles.interSubitle.copyWith(
                              color: Color(0X7F263238),
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "Tags ",
                            style: AppTextStyles.interTitle.copyWith(
                              fontSize: 19,
                            ),
                          ),
                          Text(
                            "of your product",
                            style: AppTextStyles.interSubitle.copyWith(
                              color: Color(0X7F263238),
                              fontSize: 15,
                            ),
                          ),
                        ])),
              if (!_loading)
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SearchWidget("Event type", false, false),
                          SearchWidget("Gift’s receiver", false, false),
                          SearchWidget("Receiver’s age", false, false),
                          SearchWidget("Additional tags", true, false),
                        ],
                      ),
                    ),
                  ),
                ),
              if (!_loading)
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: AddButton(context, widget.productData, this),
                ),
            ])));
  }
}

Widget AddButton(
    BuildContext context, Map<String, dynamic> productData, state) {
  // final AddItemController controller = Get.put(AddItemController());
  final ApiService apiService = ApiService(api_endpoint);
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
      state.setState(() {
        state._loading = true;
      });
      productData['tags'] = Tag.addController.tags ?? {};
      print("continue add  iiiiiiiiiiiiiiiiiiii $productData");
      // }

      // await DBGift.insertRecord(productData);

      try {
        await apiService.addGift(productData);
        // Do something after the operation is complete
      } catch (error) {
        // Handle error, if any
      }
      ContinueAddScreen.addControllers.productAdded.value = true;

      print(
          'jjjjjjjjjjjjj ${ContinueAddScreen.addControllers.productAdded.value}');
      Navigator.pop(context);
      Tag.addController.doResetTags();

      // show message added succesfuly
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Added succesfuly'),
          backgroundColor: AppColor.greenLighter,
        ),
      );
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
