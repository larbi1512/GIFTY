import 'package:flutter/material.dart';
import 'package:gifty/widgets/back_button.dart';

import '../../config/assets.config.dart';
import '../../config/colors.config.dart';
import '../../config/font.config.dart';
import '../../widgets/background_image_no_logo.dart';
import '../../widgets/white_blurry_background.dart';
import '../../widgets/bottomSheet.dart';
import 'upload_image.dart';

class EditProfile extends StatefulWidget {
  String name;
  EditProfile({super.key, required this.name});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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

  final _tx_User_name_controller = TextEditingController();
  final _tx_User_surname_controller = TextEditingController();
  final _tx_User_email_controller = TextEditingController();
  final _tx_User_phone_controller = TextEditingController();
  final _tx_User_insta_controller = TextEditingController();
  final _tx_User_facebook_controller = TextEditingController();
  final _tx_User_website_controller = TextEditingController();

  void editProfile() {
    User_name = _tx_User_name_controller.text;
    setState(() {});
  }

  Widget _FormField(BuildContext context, controller, hintText) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        controller: controller,
        style: AppTextStyles.popinsText,
        keyboardType: TextInputType.text,
        maxLines: 1,
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
          hintText: hintText,
          hintStyle: AppTextStyles.popinsText,
        ),
      ),
    );
  }

  Widget _FormField2(BuildContext context, hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(Icons.lock_rounded, color: AppColor.main),
          hintText: 'Password',
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.visibility_off_rounded),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.main),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          isDense: true,
          contentPadding: EdgeInsets.all(8),
        ),
      ),
    );
  }

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
                            height: mediaQueryData.size.height * 0.90,
                            child: SingleChildScrollView(
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: GoBackButton()),
                                    Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: UploadImage(
                                        imagePath: User_imagePath,
                                        height: 120,
                                        width: 120,
                                        edit: () {
                                          showModalBottomSheet(
                                            context: context,
                                            builder: ((builder) =>
                                                bottomSheet()),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 30),
                                    _FormField(context,
                                        _tx_User_name_controller, "Name : "),
                                    SizedBox(height: 10),
                                    _FormField(context,
                                        _tx_User_email_controller, "Email : "),
                                    SizedBox(height: 10),
                                    _FormField(
                                        context,
                                        _tx_User_phone_controller,
                                        "Phone number : "),
                                    SizedBox(height: 10),
                                    _FormField(
                                        context,
                                        _tx_User_insta_controller,
                                        "instagram : "),
                                    SizedBox(height: 10),
                                    _FormField(
                                        context,
                                        _tx_User_facebook_controller,
                                        "facebook : "),
                                    SizedBox(height: 10),
                                    _FormField(
                                        context,
                                        _tx_User_website_controller,
                                        "website : "),
                                    SizedBox(height: 15),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 35,
                                            width: 85,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColor.greenLighter,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5,
                                                        vertical: 0),
                                              ),
                                              onPressed: () {
                                                editProfile();
                                              },
                                              child: Text(
                                                "Save",
                                                style:
                                                    AppTextStyles.text.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 35,
                                            width: 85,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColor.greenLighter,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5,
                                                        vertical: 0),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Cancel",
                                                style:
                                                    AppTextStyles.text.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 25),
                                  ]),
                            )))))));
  }
}
