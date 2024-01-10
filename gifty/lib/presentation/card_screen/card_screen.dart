// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gifty/databases/DBUser_favorites.dart';
import '../../databases/DBGift.dart';
import '../../databases/DBUsercart.dart';
import '../cartScreen/cartPage.dart';
import '../profile/provider_contact.dart';
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
  String Provider_imagePath = Assets.images.providerImage;
  String Provider_name = "Flower paradise Event";
  String Provider_storePlace = "Baba hsen, Algiers";
  String Provider_storeName = "Store";

  @override
  Widget build(BuildContext context) {
    Future<Map<String, dynamic>?> productInfo =
        DBGift.getProductById(widget.productId);
    return SafeArea(
      child: Scaffold(
          floatingActionButton: const GoBackButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          body: SingleChildScrollView(
            child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 21, vertical: 15),
                child: FutureBuilder(
                  future: productInfo,
                  builder: _build_product_info,
                )),
          )),
    );
  }

  Widget _build_product_info(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      Map item = snapshot.data as Map;
      return getWidgetForProductInfo(item, this);
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }
    return CircularProgressIndicator();
  }

  Widget getWidgetForProductInfo(Map item, stateWidget) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.58,
            // width: size.width * 0.89,
            // width: 387,

            // child: ProductCard(item: item, widgetState: stateWidget),
            child: ProductCard(item: item),
          ),
          const SizedBox(height: 20),
          Provider(providerInfo: item['providerInfo'], item: item),
          // const SizedBox(height: 10),
          // OtherProviders(),
          SizedBox(height: 5)
        ]);
  }
}

class ProductCard extends StatefulWidget {
  final Map item;

  ProductCard({required this.item, Key? key}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: widget.item['imageList']?.length ?? 0,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: AppColor.main,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: getItemImageProvider(index),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
            );
          },
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
            height: MediaQuery.of(context).size.height * 0.5,
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
                            widget.item['name'],
                            style: AppTextStyles.subtitle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // wishList.widget.setState(() {});
                              setState(() {
                                if (widget.item['isFavorite']) {
                                  DBUserFavorits.deleteRecord(
                                      1, widget.item['id']);
                                } else {
                                  DBUserFavorits.insertRecord({
                                    'user_id': 1,
                                    'product_id': widget.item['id']
                                  });
                                }
                                widget.item['isFavorite'] =
                                    !widget.item['isFavorite'];
                              });
                              //       //addToFavorite();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: (widget.item['isFavorite'])
                                      ? AssetImage(
                                          Assets.images.iconHeartActiveWhite)
                                      : AssetImage(
                                          Assets.images.iconHeartWhite),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ])),
                const SizedBox(height: 5),
                Container(
                    width: 282,
                    margin: const EdgeInsets.only(left: 6, right: 64),
                    child: Text(
                      "${widget.item['price'].toString()} DZD",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.text.copyWith(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    )),
                const SizedBox(height: 12),
                Container(
                    width: 282,
                    margin: const EdgeInsets.only(left: 6, right: 64),
                    child: Text(
                      widget.item['description'],
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.text.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    )),
                const SizedBox(height: 3),
                Container(
                    width: 282,
                    margin: const EdgeInsets.only(left: 6, right: 64),
                    child: Text(
                      "available in: ${widget.item['colorsList'].join(', ')}",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.text.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ))
              ]),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: IgnorePointer(
            ignoring: false,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                print("ùùùùùùùùùùùùùùùùù $currentIndex");
                if (currentIndex > 0) currentIndex = (currentIndex - 1);
                setState(() {});
                _pageController.animateToPage(
                  currentIndex,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IgnorePointer(
            ignoring: false,
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              onPressed: () {
                print("ùùùùùùùùùùùùùùùùù $currentIndex");
                if (currentIndex < widget.item['imageList']!.length - 1)
                  currentIndex = (currentIndex + 1);
                setState(() {});
                _pageController.animateToPage(
                  currentIndex,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  ImageProvider<Object> getItemImageProvider(int index) {
    if (widget.item['imageList'] == null || widget.item['imageList']!.isEmpty) {
      return AssetImage(Assets.images.providerImage);
    }

    String imagePath = widget.item['imageList']![index]['imagePath'];
    String imageType = widget.item['imageList']![index]['type'];

    switch (imageType) {
      case 'file':
        return FileImage(File(imagePath));
      case 'asset':
        return AssetImage(imagePath);
      case 'url':
        return NetworkImage(imagePath);
      default:
        return AssetImage(Assets.images.itemImage);
    }
  }
}

class Provider extends StatelessWidget {
  final Map providerInfo;
  final Map item;

  Provider({
    super.key,
    required this.providerInfo,
    required this.item,
  });
  Future<void> _testInsert(int id, int prid) async {
    Map<String, dynamic> testData = {
      'user_id': id,
      'product_id': prid,
      'title': 'Test Product',
      'remote_id': 123,
      'amount': 1,
      'price': prid,
    };
    await DBUserCart.insertRecord(testData);
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String Provider_imagePath =
        providerInfo['brand_pic'] ?? Assets.images.providerImage;
    String Provider_name = providerInfo['store_name'] ?? "Bahdja telecom";
    String Provider_storePlace =
        providerInfo['location'] ?? "Baba hsen, Algiers";
    String Provider_storeName = "Store";
    return Container(
      decoration: BoxDecoration(
        color: AppColor.main,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Provider 🌟",
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
                        "See others",
                        style: AppTextStyles.subtitle.copyWith(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    )
                  ])),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProviderContact(),
                ),
              );
            },
            child: Container(
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
                    onPressed: () async {
                      await _testInsert(1, item['id']);
                      Navigator.pop(context);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartPage(
                            userId: 1,
                          ),
                        ),
                      );
                    },
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
            ),
          ),
        ],
      ),
    );
  }
}

class OtherProviders extends StatelessWidget {
  String Item_imagePath = Assets.images.itemImage;
  String Item_name = "Bouquet";
  bool Item_isFavorite = false;
  String Item_description =
      "Lorem ipsum dolor sit amet consectetur. Aliquam amet volutpat in vestibulum bibendum egestas integer nibh..";
  String Provider_imagePath = Assets.images.providerImage;
  String Provider_name = "Flower paradise Event";
  String Provider_storePlace = "Baba hsen, Algiers";
  String Provider_storeName = "Store";

  OtherProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.mainLighter,
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
                      "Others ",
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
