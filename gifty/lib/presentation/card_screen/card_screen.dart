// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../databases/DBGift.dart';
import '/config/assets.config.dart';
import '/config/colors.config.dart';
import '/config/font.config.dart';
import '../../widgets/back_button.dart';

import '../providers_list/providers_list_screen.dart';

class CardScreen extends StatefulWidget {
  final int productId;
  const CardScreen({super.key, required this.productId});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  //List <Provider> providers= ;
  // Future<Map<String, dynamic>?> itemInfo2 = DBGift.getProductById(1);

  static Map itemInfo = {
    'Item_imagePath': Assets.images.itemImage,
    'Item_name': "Bouquet",
    'Item_isFavorite': false,
    'Item_description':
        "Lorem ipsum dolor sit amet consectetur. Aliquam amet volutpat in vestibulum bibendum egestas integer nibh..",
  };
  String Item_imagePath = itemInfo['Item_imagePath'];
  String Item_name = itemInfo['Item_name'];
  bool Item_isFavorite = itemInfo['Item_isFavorite'];
  String Item_description = itemInfo['Item_description'];
  String Provider_imagePath = Assets.images.providerImage;
  String Provider_name = "Flower paradise Event";
  String Provider_storePlace = "Baba hsen, Algiers";
  String Provider_storeName = "Store";

  @override
  Widget build(BuildContext context) {
    print('**************************\n${widget.productId}');
    Future<Map<String, dynamic>?> productInfo =
        DBGift.getProductById(widget.productId);
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          floatingActionButton: const GoBackButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 21, vertical: 15),
              child: FutureBuilder(
                future: productInfo,
                builder: _build_product_info,
              )
              // Column(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       const SizedBox(height: 37),
              //       SizedBox(
              //           height: size.height * 0.54,
              //           // width: size.width * 0.89,
              //           width: 387,
              //           child: ProductCard(
              //               Item_imagePath: Item_imagePath,
              //               Item_name: Item_name,
              //               Item_isFavorite: Item_isFavorite,
              //               Item_description: Item_description)),
              //       const SizedBox(height: 20),
              //       Providers(),
              //       SizedBox(height: 5)
              //     ])
              )),
    );
  }

  Widget _build_product_info(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      Map item = snapshot.data as Map;
      print('*******************************: $item');
      return getWidgetForProductInfo(item, this);
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }
    return CircularProgressIndicator();
  }

  Widget getWidgetForProductInfo(Map item, stateWidget) {
    return
        // Column(
        //   children: [
        //     Card(
        //         elevation: 10,
        //         child: ListTile(
        //           title: Text(item['name'], style: TextStyle(fontSize: 30)),
        //           trailing: Text(item['barcode']),
        //         )),
        //     SizedBox(height: 10),
        //     Row(
        //       children: [Text(item['type']), Spacer(), Text(item['company'])],
        //     ),
        //     SizedBox(height: 10),
        //     showImagesGrid(item['imageList'], true, stateWidget),
        //   ],
        // );
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          const SizedBox(height: 37),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.54,
              // width: size.width * 0.89,
              width: 387,
              child: ProductCard(
                  Item_imagePath: itemInfo['Item_imagePath'],
                  Item_name: item['name'],
                  Item_isFavorite: itemInfo['Item_isFavorite'],
                  Item_description: item['description'])),
          const SizedBox(height: 20),
          Providers(),
          SizedBox(height: 5)
        ]);
  }
}

class ProductCard extends StatelessWidget {
  final String Item_imagePath;
  final String Item_name;
  bool Item_isFavorite;
  final String Item_description;

  ProductCard(
      {required this.Item_imagePath,
      required this.Item_name,
      required this.Item_isFavorite,
      required this.Item_description,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Container(
        decoration: BoxDecoration(
          color: AppColor.main,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(Item_imagePath),
            fit: BoxFit.cover,
          ),
        ),
        height: 510,
        width: 387,
        alignment: Alignment.center,
      ),
      ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [Colors.transparent, Colors.black],
            stops: [0.2, 0.8],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstIn,
        child: Container(
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.main,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 29),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          Item_name,
                          style: AppTextStyles.subtitle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     // setState(() {
                        //     //   Item_isFavorite = !Item_isFavorite;
                        //     // });
                        //     // Obx(() {
                        //     //   Item_isFavorite = !Item_isFavorite;
                        //     // });
                        //     //addToFavorite();
                        //   },
                        //   child:
                        Icon(
                          Item_isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.white,
                        ),
                        // ),

                        //the icon from figma
                        // InkWell(
                        //   onTap: () {
                        //  setState(() {
                        //         Item_isFavorite =
                        //             !Item_isFavorite;
                        //       });
                        //       //addToFavorite();
                        //   },
                        //   child: Container(
                        //     padding: EdgeInsets.all(
                        //         16.0),
                        //     child: SvgPicture.asset(
                        //       'assets/images/icons/img_nav_liked.svg',
                        //       width: 20.0,
                        //       height: 20.0,
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // ),
                      ])),
              const SizedBox(height: 12),
              Container(
                  width: 282,
                  margin: const EdgeInsets.only(left: 6, right: 64),
                  child: Text(
                    Item_description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.text.copyWith(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ))
            ]),
      ),
    ]);
  }
}

class Providers extends StatelessWidget {
  String Item_imagePath = Assets.images.itemImage;
  String Item_name = "Bouquet";
  bool Item_isFavorite = false;
  String Item_description =
      "Lorem ipsum dolor sit amet consectetur. Aliquam amet volutpat in vestibulum bibendum egestas integer nibh..";
  String Provider_imagePath = Assets.images.providerImage;
  String Provider_name = "Flower paradise Event";
  String Provider_storePlace = "Baba hsen, Algiers";
  String Provider_storeName = "Store";

  Providers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.main,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 216,
      width: 387,
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Providers 🌟",
                      style: AppTextStyles.subtitle.copyWith(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProvidersListPage(),
                          ),
                        );
                      },
                      child: Text(
                        "See all",
                        style: AppTextStyles.subtitle.copyWith(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    )
                  ])),
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 2,
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(27)),
                        child: Container(
                          decoration: BoxDecoration(
                            //border: border,
                            borderRadius: BorderRadius.circular(27),
                          ),
                          child: Image.asset(
                            Provider_imagePath,
                            height: 47,
                            width: 47,
                            fit: BoxFit.cover,
                            //color: color,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8,
                          top: 4,
                          bottom: 4,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Provider_name,
                              style: AppTextStyles.text.copyWith(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 1),
                            Row(
                              children: [
                                Opacity(
                                  opacity: 0.7,
                                  child: Text(
                                    Provider_storePlace,
                                    style: AppTextStyles.text.copyWith(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 1,
                                    top: 1,
                                    bottom: 1,
                                  ),
                                  child: Text(
                                    ".",
                                    style: AppTextStyles.text.copyWith(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.7,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Text(
                                      Provider_storeName,
                                      style: AppTextStyles.text.copyWith(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.greenLighter,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 0),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Add",
                          style: AppTextStyles.text.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
