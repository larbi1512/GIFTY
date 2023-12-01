import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/config/font.config.dart';

class bottomSheet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
       height: 150.0,
       width: MediaQuery.of(context).size.width,
       margin: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 20,
       ),
       child: Column(children: <Widget>[
        Text(
          "Choose profile pic",
          style: AppTextStyles.Hello,
        ),
        SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
          ElevatedButton.icon(onPressed:(){}, 
          icon: Icon(Icons.camera, color: AppColor.main,),
          label: Text("Camera")),
          ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.image,
                  color: AppColor.main,
                ),
                label: Text("Gallery")),
           
       ],)
       ]),
    );
  }
}