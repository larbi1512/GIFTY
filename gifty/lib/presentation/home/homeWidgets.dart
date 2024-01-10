import 'package:flutter/material.dart';
import 'package:gifty/databases/DBGift.dart';
import 'package:gifty/presentation/home/SeeMore.dart';
import 'package:gifty/widgets/favorite_item.dart';
import 'package:gifty/config/colors.config.dart';

import '../../constants/endpoints.dart';
import '../../services/api_service.dart';
import '../add_item_screen/add_item_screen.dart';

const List<String> imagePaths = [
  'assets/images/goods.jpeg',
  'assets/images/gift.jpeg',
  'assets/images/watch.png',
  'assets/images/gift.jpeg',
  'assets/images/watch.png',
  'assets/images/book.png',
  'assets/images/gif.jpg',
  'assets/images/flwr3.png',
  'assets/images/book.png',
  'assets/images/goods.jpeg',
  'assets/images/gif.jpg',
  'assets/images/flwr3.png',
];

const List<String> imagePathsFlowers = [
  'assets/images/flwr3.png',
  'assets/images/flowers3.png',
  'assets/images/flower.jpeg',
  'assets/images/flowr.png',
  'assets/images/flwr2.png',
];

class HomeScreen extends StatelessWidget {
  final ApiService apiService = ApiService(api_endpoint);
  @override
  Widget build(BuildContext context) {
    Future<List> gifts = getListGifts();
    Future<List> flowers = getListFlowers();
    Future<List> inspirations = getListInspo();
    return RawScrollbar(
      trackColor: AppColor.mainLighter,
      thumbColor: AppColor.greenLighter,
      radius: Radius.circular(20),
      thickness: 10,
      trackVisibility: true,
      thumbVisibility: true,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: SearchBarApp(),
              ),
              FutureBuilder(
                future: gifts,
                builder: _build_list_gifts,
              ),
              FutureBuilder(
                future: flowers,
                builder: _build_list_flowers,
              ),
              FutureBuilder(
                future: inspirations,
                builder: _build_list_inspirations,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Map>> getListGifts() async {
    // List<Map<String, dynamic>> remote_data = await apiService.fetchGifts();
    // print('Data from server: $remote_data');
    // DBGift.syncGifts(remote_data);
    await apiService.service_sync_gifts();
    return DBGift.getAllGifts();
  }

  Future<List<Map>> getListFlowers() async {
    return DBGift.getAllGifts();
  }

  Future<List<Map>> getListInspo() async {
    return DBGift.getAllGifts();
  }

  Widget _build_list_gifts(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      List<Map> gifts = snapshot.data as List<Map>;
      return CategoryRow(
        title: 'gifts',
        productsList: gifts,
        imagePaths: imagePaths,
      );
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }
    return CircularProgressIndicator();
  }

  Widget _build_list_flowers(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      List<Map> flowers = snapshot.data as List<Map>;
      return CategoryRow(
        title: 'flowers',
        productsList: flowers,
        imagePaths: imagePaths,
      );
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }
    return CircularProgressIndicator();
  }

  Widget _build_list_inspirations(
      BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      List<Map> inspirations = snapshot.data as List<Map>;
      return CategoryRow(
        title: 'inspirations',
        productsList: inspirations,
        imagePaths: imagePaths,
      );
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }
    return CircularProgressIndicator();
  }
}

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Future<List> search_result =
    //     DBGift.getAllProductsByKeyword(_searchController.text);
    return Container(
      height: 50,
      width: 350,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Looking for an item?',
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () => _searchController.clear(),
          ),
          prefixIcon: Container(
            margin: EdgeInsets.only(right: 15.0),
            height: 50,
            width: 65,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(222, 182, 171, 1.0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(50.0),
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(0.0),
              ),
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FutureBuilder(
                        future: DBGift.getAllProductsByKeyword(
                            _searchController.text),
                        builder: _build_search_result,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _build_search_result(BuildContext context, AsyncSnapshot snapshot) {
    // _searchController.clear();
    if (snapshot.hasData) {
      List<Map> search_result = snapshot.data as List<Map>;
      return SeeMore(
        title: "result for ${_searchController.text}",
        productsList: search_result,
      );
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }
    return CircularProgressIndicator();
  }
}

class CategoryRow extends StatelessWidget {
  final String title;
  final List<String> imagePaths;
  final List productsList;

  const CategoryRow({
    required this.title,
    required this.imagePaths,
    required this.productsList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                    shadows: [
                      Shadow(
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        offset: Offset(1.0, 3.0),
                        blurRadius: 5.0,
                      ),
                    ],
                    fontSize: 24,
                    fontFamily: 'inter',
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(133, 88, 111, 1.0)),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SeeMore(
                              title: "find the best $title",
                              productsList: productsList,
                            )),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, // Background color
                  elevation: 0, // Elevation
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), // Radius
                  ),
                ),
                child: const Text('See more',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'inter',
                      fontWeight: FontWeight.w600,
                      color: AppColor.main,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColor.main,
                    ),
                    textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
        Container(
          height: (MediaQuery.of(context).size.height * 0.3),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productsList.length,
            // itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              print('\nggggggggggggggggggg: ${productsList[index]}');
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: LikedItemWidget(
                    widgetState: AddItemScreen,
                    product: productsList[index],
                    isinFav: false),
              );
            },
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}

class HomeItem extends StatelessWidget {
  final String imagePath;
  final double size;
  final double border;

  const HomeItem(
      {required this.imagePath,
      required this.size,
      required this.border,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2), // changes the position of the shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
            border), // Use the same radius as in the box decoration
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: 114,
          height: 116,
        ),
      ),
    );
  }
}
