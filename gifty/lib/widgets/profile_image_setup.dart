import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gifty/config/assets.config.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/config/font.config.dart';
import 'package:gifty/widgets/bottomSheet.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/endpoints.dart';

class ProfileImageSetup extends StatefulWidget {
  final String hintText;
  final String userId;
  final String providerId;

  ProfileImageSetup(
      {Key? key,
      required this.hintText,
      required this.userId,
      required this.providerId})
      : super(key: key);

  @override
  State<ProfileImageSetup> createState() => _ProfileImageSetupState();
}

class _ProfileImageSetupState extends State<ProfileImageSetup> {
  final picker = ImagePicker();
  XFile? pickedImage;

  Future<void> uploadImage(
      String userId, File imageFile, String providerId) async {
    try {
      final endpoint = providerId.isNotEmpty
          ? api_endpoint_finish_signup_provider
          : api_endpoint_finish_signup_user;
      final uri = Uri.parse(endpoint);
      final request = http.MultipartRequest('POST', uri);

      request.files
          .add(await http.MultipartFile.fromPath('file', imageFile.path));
      request.fields['user_id'] = userId;
      request.fields['provider_id'] = providerId;
      print("user Id is:$userId");

      final response = await request.send();

      if (response.statusCode == 200) {
        print('Image uploaded successfully');
      } else {
        print('Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error uploading image: $error');
      // Handle error
    }
  }

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
              // Upload the selected image
              if (pickedImage != null) {
                final imageFile = File(pickedImage!.path);
                uploadImage(widget.userId, imageFile, widget.providerId);
              }
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
