import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/config/font.config.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetWidget extends StatelessWidget {
  final ImagePicker picker;

  const BottomSheetWidget(this.picker, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose profile pic",
            style: AppTextStyles.Hello,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  final XFile? pickedImage =
                      await picker.pickImage(source: ImageSource.camera);
                  if (pickedImage != null) {
                    Navigator.of(context)
                        .pop(pickedImage); // Return the selected image
                  } else {
                    // User cancelled the picker
                  }
                },
                icon: Icon(Icons.camera, color: AppColor.main),
                label: Text("Camera"),
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  final XFile? pickedImage =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    Navigator.of(context)
                        .pop(pickedImage); // Return the selected image
                  } else {
                    // User cancelled the picker
                  }
                },
                icon: Icon(
                  Icons.image,
                  color: AppColor.main,
                ),
                label: Text("Gallery"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
