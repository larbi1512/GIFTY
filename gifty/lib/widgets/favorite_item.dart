import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';

import '../presentation/card_screen/card_screen.dart';

class LikedItemWidget extends StatelessWidget {
  final Map product;
  final bool isinFav;
  const LikedItemWidget(
      {required this.product, this.isinFav = true, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CardScreen(productId: product['id'])),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: isinFav ? (MediaQuery.of(context).size.height * 0.32) : 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColor.main.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Align content in the center

          children: [
            SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.transparent,
                    AppColor.main.withOpacity(0.5),
                  ],
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    AppColor.main.withOpacity(isinFav ? 0.6 : 0.5),
                    BlendMode.srcOver,
                  ),
                  child:
                      // Image.file(
                      //   File(product['imagePath']),
                      //   fit: BoxFit.cover,
                      //   width: 150,
                      //   height: 150,
                      // ),
                      Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(File(product['imagePath'])),
                              fit: BoxFit.cover,
                            ),
                            // borderRadius: BorderRadius.circular(20),
                          )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  product['name'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${product['type'] ?? 'gift'}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Visibility(
              visible: isinFav,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "${product['price']} DZD",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColor.peach,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          const Color.fromARGB(255, 212, 212, 212)
                              .withOpacity(0.5),
                          const Color.fromARGB(255, 237, 237, 237)
                              .withOpacity(1),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.favorite,
                          color: AppColor.main,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
