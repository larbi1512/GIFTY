import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gifty/config/colors.config.dart';

import '../../controllers/add_item_controller.dart';

class ColorsInput extends StatefulWidget {
  @override
  _ColorsInputState createState() => _ColorsInputState();
}

class _ColorsInputState extends State<ColorsInput> {
  final TextEditingController _controller = TextEditingController();
  final AddItemController controller = Get.put(AddItemController());
  // List<String> _colors = [];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(
            () => Wrap(
              direction: Axis.horizontal,
              spacing: 8.0,
              runSpacing: 4.0,
              children: controller.colors.map((color) {
                return Chip(
                  backgroundColor: AppColor.peach,
                  deleteIcon: Icon(Icons.cancel_outlined,
                      color: AppColor.main, size: 20),
                  label: Text(
                    color,
                    style: TextStyle(
                      color: AppColor.main,
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onDeleted: () {
                    controller.doRemoveColor(color);
                  },
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _controller,
          onSubmitted: (value) {
            controller.doAddColor(value);
            _controller.clear();
          },
          style: TextStyle(
            color: AppColor.main,
            fontSize: 15,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.palette,
              color: AppColor.main,
            ),
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
            hintText: 'Available colors',

            // contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
          ),
        ),
      ],
    );
  }
}
