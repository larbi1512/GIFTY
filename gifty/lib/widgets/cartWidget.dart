import 'package:flutter/material.dart';
import 'package:gifty/config/font.config.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/presentation/home/homeWidgets.dart';


class cartWidget extends StatelessWidget {
  const cartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 19, right: 19, top: 19),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12 , vertical:5 ),
            child: Row(
              children: <Widget>[
                HomeItem(imagePath:  'assets/images/inspo.jpeg' , size: 80 , border : 15),
                Expanded(
                  child: Container(
                     margin: EdgeInsets.only(left: 16.0),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 8, top: 4),
                          child: Text(
                            "Lorem",
                            maxLines: 2,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                           
                          ),
                        ),
                      
                        Text(
                          "200.3 DA",
                          style:  TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColor.peach,
                      ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Size : US 7",
                               
                              ),
                              
                            ],
                          ),
                        ),
                  //     ElevatedButton(
                  //   onPressed: () {
                     
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     shape: CircleBorder(),
                  //     backgroundColor:  Colors.grey.shade200,
                  //     foregroundColor: AppColor.mainLighter,
                  //   ),
                  //    child: Icon(Icons.favorite , size: 19),
                  // ),
                      ],
                    ),
                  ),
                  flex: 100,
                ),
                Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
                                    ),
                                      padding: const EdgeInsets.only(top : 3 , bottom: 3 , right: 6, left: 6),
                                      child: Icon(
                                        Icons.remove,
                                        size: 24,
                                        color: AppColor.main,
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      padding: const EdgeInsets.only(bottom: 2, right: 12, left: 12),
                                      child: Text(
                                        "1",
                                       
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
                                    ),
                                      padding: const EdgeInsets.only(top : 3 , bottom: 3 , right: 6, left: 6),
                                      child: Icon(
                                        Icons.add,
                                        size: 24,
                                        color: AppColor.main,
                                      ),
                                    ),
                                  ],
                                ),
                              )
              ],
            ),
          ),
        ),
        // Align(
        //   alignment: Alignment.topRight,
        //   child: Container(
        //     width: 24,
        //     height: 24,
        //     alignment: Alignment.center,
        //     margin: EdgeInsets.only(right: 10, top: 8),
        //     child: Icon(
        //       Icons.close,
        //       color: Colors.white,
        //       size: 20,
        //     ),
        //     decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4)), color: AppColor.mainLighter),
        //   ),
        // )
      ],
    );
  }
}