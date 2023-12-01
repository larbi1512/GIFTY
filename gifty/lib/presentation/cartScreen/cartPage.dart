import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/widgets/cartWidget.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  Color.fromRGBO(255, 242, 238, 1.0),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
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
                    padding: EdgeInsets.all(5),
                    backgroundColor: AppColor.mainLighter,
                    foregroundColor: Color.fromRGBO(255, 242, 238, 1.0),
                  ),
                ),
              ],
              ),
          ),

          const Expanded(child: RawScrollbar(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  cartWidget(),
                  cartWidget(),
                  cartWidget(),
                  cartWidget(),
                  cartWidget(),
                  cartWidget(),
                  cartWidget(),
                  cartWidget(),
                  cartWidget(),
                ],
              ),
            ),
          )
          ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10 ),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total price:",
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 0.5),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "200.00 Da",
                      style: TextStyle(
                        fontSize: 24,
                         fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(5),
                    backgroundColor: AppColor.main,
                    foregroundColor: Color.fromRGBO(255, 242, 238, 1.0),
                  ),
                onPressed: () {
                  // Add your onPressed logic here
                },
                child: Text("Next"),
              ),
            ],
                   ),
         ),

        ],
      )
    );
  }
}