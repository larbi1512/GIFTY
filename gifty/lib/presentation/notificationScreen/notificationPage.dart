import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/widgets/cartWidget.dart';


class NotificationPage extends StatelessWidget {
  const NotificationPage
({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  Color.fromRGBO(255, 242, 238, 1.0),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(5),
                    backgroundColor: AppColor.mainLighter,
                    foregroundColor: Color.fromRGBO(255, 242, 238, 1.0),
                  ),
                ),
                const Text(
                  "Cart",
                  style:  TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.main,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.delete),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(2),
                    backgroundColor: AppColor.mainLighter,
                    foregroundColor: Color.fromRGBO(255, 242, 238, 1.0),
                  ),
                ),
              ],
              ),
          ),
        ],
      ),
    );

  }
}