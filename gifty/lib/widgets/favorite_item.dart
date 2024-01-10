import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';

import '../config/assets.config.dart';
import '../databases/DBUser_favorites.dart';
import '../presentation/card_screen/card_screen.dart';

class LikedItemWidget extends StatelessWidget {
  dynamic widgetState;
  final Map product;
  final bool isinFav;
  LikedItemWidget(
      {required this.widgetState,
      required this.product,
      this.isinFav = true,
      super.key});

  ImageProvider<Object> getImageProvider(String? imagePath, String? imageType) {
    if (imagePath == null || imageType == null) {
      print("nul type or path   $imagePath , $imageType");
      return AssetImage(Assets.images.itemImage);
    }
    print("\n hhhhhhhhhhhhhhhhhhh $imageType");

    switch (imageType) {
      case 'file':
        return FileImage(File(imagePath));
      case 'asset':
        return AssetImage(imagePath);
      case 'url':
        return NetworkImage(imagePath);
      default:
        return AssetImage(Assets.images.iconMagic);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CardScreen(productId: product['remote_id'])),
        );
        if (isinFav) widgetState.setState(() {});
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: isinFav
            ? (MediaQuery.of(context).size.height * 0.335)
            : (MediaQuery.of(context).size.height * 0.3),
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
                  child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: getImageProvider(
                              product['imagePath'], product['type']),
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
                  "${product['category'] ?? 'gift'}",
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
                      child:
                          // InkWell(
                          //   onTap: () {},
                          //   child: Icon(
                          //     Icons.favorite,
                          //     color: AppColor.main,
                          //   ),
                          // ),
                          InkWell(
                        onTap: () {
                          widgetState.setState(() {
                            if (product['isFavorite']) {
                              DBUserFavorits.deleteRecord(1, product['id']);
                            } else {
                              DBUserFavorits.insertRecord(
                                  {'user_id': 1, 'product_id': product['id']});
                            }
                            product['isFavorite'] = !product['isFavorite'];
                          });
                          //       //addToFavorite();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: (product['isFavorite'])
                                  ? AssetImage(Assets.images.iconHeartActive)
                                  : AssetImage(Assets.images.iconHeart),
                              fit: BoxFit.contain,
                            ),
                          ),
                          height: 23,
                          width: 23,
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
