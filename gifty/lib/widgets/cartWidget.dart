import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/presentation/home/homeScreen.dart';
import 'package:gifty/presentation/home/homeWidgets.dart';
import 'package:gifty/databases/DBUsercart.dart';



class CartWidget extends StatefulWidget {
  final String title;
  final int price;
  final int amount;
  final int user_id;
  final int product_id;
  var widgetState ;

 
   CartWidget({
    required this.title,
    required this.price,
    required this.amount,
    required this.user_id,
    required this.product_id,
     required this.widgetState,
    Key? key,
  }) : super(key: key);
  
   @override
  _CartWidgetState createState() => _CartWidgetState();
}


class _CartWidgetState extends State<CartWidget> {
   late int _currentAmount;

    Future<void> _testDelete(int user_id , int product_id) async {
     await DBUserCart.deleteRecord(user_id , product_id);
     widget.widgetState.setState((){});
   }
 

   void initState() {
    super.initState();
    _currentAmount = widget.amount;
  }

   void _incrementAmount(int user_id , int product_id , new_data) {
        setState(() {
          _currentAmount++;
          newData['amount'] = _currentAmount;
            DBUserCart.updateRecord(user_id, product_id, new_data);
        });
  }
   void _decrementAmount(int user_id , int product_id , new_data) {
        setState(() {
          _currentAmount--;
          newData['amount'] = _currentAmount;
            DBUserCart.updateRecord(user_id, product_id, new_data);
        });
  }
   
       Map<String, dynamic> newData = {
    'amount': 1, // Update the amount to 5
    'price': 20, // Update the price to 20
  };


  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
         margin: EdgeInsets.only(left: 10, right: 10, top: 19),
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
                            widget.title,
                            maxLines: 2,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                           
                          ),
                        ),
                      
                        Text(
                          widget.price.toString(),
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
                                    GestureDetector(
                                      onTap: () => _decrementAmount(1 , widget.product_id ,newData),
                                      child: Container(
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
                                    ),
                                    Container(
                                      color: Colors.white,
                                      padding: const EdgeInsets.only(bottom: 2, right: 12, left: 12),
                                      child: Text(
                                         _currentAmount.toString(),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => _incrementAmount(1 ,  widget.product_id , newData),
                                      child: Container(          
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
                                    ),
                                  ],
                                ),
                              )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap:  () async => {
               await _testDelete(1, widget.product_id)
            } ,
            child: Container(
              width: 24, 
              height: 24,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 10, top: 8),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4)), color: AppColor.mainLighter),
            ),
          ),
        )
      ],
    );
  }
}