import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/widgets/favorite_item.dart';

class SeeMore extends StatefulWidget {
  final List productsList;
  final String title;

  const SeeMore({required this.title, required this.productsList, super.key});

  @override
  State<SeeMore> createState() => _SeeMoreState();
}

class _SeeMoreState extends State<SeeMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 242, 238, 1.0),
      body: RawScrollbar(
        trackColor: AppColor.mainLighter,
        thumbColor: AppColor.greenLighter,
        radius: Radius.circular(20),
        thickness: 10,
        trackVisibility: true,
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 8, top: 20, right: 8, bottom: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                          context); // Navigate back to the previous page
                    },
                    child: Icon(Icons.arrow_back),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(5),
                      backgroundColor: AppColor.mainLighter,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 3.0, horizontal: 12.0),
                  child: Text(widget.title,
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            color: Color.fromRGBO(0, 0, 0,
                                0.3), // You can change the shadow color
                            offset: Offset(
                                1.0, 3.0), // You can change the shadow offset
                            blurRadius: 5.0, // You can change the blur radius
                          ),
                        ],
                        fontSize: 24,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w700,
                        color: AppColor.mainLighter,
                      )),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8.0, // Adjust the spacing between cards
                  runSpacing: 8.0,
                  children: [
                    for (var product in widget.productsList)
                      LikedItemWidget(
                          widgetState: this, product: product, isinFav: true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
