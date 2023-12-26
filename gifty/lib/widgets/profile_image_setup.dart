import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gifty/config/assets.config.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/config/font.config.dart';
import 'package:gifty/widgets/bottomSheet.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageSetup extends StatefulWidget {
  final String hintText;

  ProfileImageSetup({Key? key, required this.hintText}) : super(key: key);

  @override
  State<ProfileImageSetup> createState() => _ProfileImageSetupState();
}

class _ProfileImageSetupState extends State<ProfileImageSetup> {
  final picker = ImagePicker();
  XFile? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 80,
          backgroundImage: pickedImage != null
            ? FileImage(File(pickedImage!.path))
            : AssetImage(Assets.images.profilePic) as ImageProvider<Object>?,
        ),
        SizedBox(height: 20.0),
        Text(
          widget.hintText,
          style: AppTextStyles.Hello,
        ),
        SizedBox(height: 20.0),
        InkWell(
          onTap: () async {
            XFile? selectedImage = await showModalBottomSheet(
              context: context,
              builder: ((builder) => BottomSheetWidget(picker)),
            );
            if (selectedImage != null) {
              setState(() {
                pickedImage = XFile(selectedImage.path);
              });
            } else {
              // User cancelled the picker
            }
          },
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              color: AppColor.mainLighter,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.all(12),
            child: Icon(
              Icons.add_a_photo_outlined,
              color: Colors.white,
              size: 35.0,
            ),
          ),
        ),
      ],
    );
  }
}
