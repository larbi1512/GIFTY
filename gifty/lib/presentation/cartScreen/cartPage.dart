import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/presentation/home/homeScreen.dart';
import 'package:gifty/widgets/cartWidget.dart';
import 'package:gifty/databases/DBUsercart.dart';


class CartPage extends StatefulWidget {
  final int userId;
  const CartPage({required this.userId, Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Future<List<Map<String, dynamic>>> futureCartItems;
    int cartnbr = 0;
    double totalSum = 0;

 void initState() {
    super.initState();
    futureCartItems = DBUserCart.getAllCarItemsOfUser(widget.userId);
    _calculateTotal();
  }
    void _calculateTotal() async {
    final cartItems = await futureCartItems;
    double sum = 0;
    for (var cartItem in cartItems) {
      int price = cartItem['price'];
      int amount = cartItem['amount'];
      sum += price * amount;
    }
    setState(() {
      totalSum = sum;
    });
  }
  void _updateTotal(int newAmount, int oldAmount, int price) {
    setState(() {
      totalSum += (newAmount - oldAmount) * price;
    });
  }

  Future<void> _testInsert(int id , int prid) async {
  Map<String, dynamic> testData = {
    'user_id': id,
    'product_id': prid,
    'title': 'Test Product',
    'remote_id': 123, 
    'amount': 1,
    'price': prid, 
  };
  await DBUserCart.insertRecord(testData);
  setState(() {});
}

  @override
  Widget build(BuildContext context) {
  final  futureCartItems = DBUserCart.getAllCarItemsOfUser(widget.userId);

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 242, 238, 1.0),
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
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.main,
                  ),
                ),
                ElevatedButton(
                  onPressed: ()
                    async {
                       await DBUserCart.deleteAll(1);
                       setState(() {
                        });
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
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: futureCartItems,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show a loading indicator while fetching data
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                 double total = 0;  
                 List<Widget> cartWidgets = [];

                for (var cartItem in snapshot.data!) {  
                  String title = cartItem['title'];
                  int price = cartItem['price'];
                  int amount = cartItem['amount'];
                  int productID = cartItem['product_id'];


                  total += price * amount;
                  cartWidgets.add(
                    CartWidget(
                      title: title,
                      price: price,
                      user_id: user_id,
                      product_id: productID ,
                      amount: amount,
                      widgetState : this,
                      onAmountChanged: (int newAmount) {
                      setState(() {
                        totalSum += (newAmount - amount) * price; 
                         _updateTotal(newAmount, amount, price);
                        cartItem['amount'] = newAmount; 
                      });
                    }
                    ),
                  );
                }
                  return RawScrollbar(
                    trackColor: AppColor.mainLighter,
                    thumbColor: AppColor.greenLighter,
                    radius: Radius.circular(20),
                    thickness: 10,
                    trackVisibility: true,
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      child: Column(
                        children: cartWidgets,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                        totalSum.toString(),
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
                  onPressed: () async{
                      cartnbr++;
                      await _testInsert(1 , cartnbr);
                  } ,
                  child: Text("Next"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
