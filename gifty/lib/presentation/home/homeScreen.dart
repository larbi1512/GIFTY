import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gifty/presentation/cartScreen/cartPage.dart';
import 'package:gifty/presentation/wishlist/favorites.dart';
import 'package:gifty/presentation/home/SeeMore.dart';
import 'package:gifty/presentation/home/homeWidgets.dart';

import '../../controllers/navbar_controller.dart';
import '../../widgets/bottom_navbar/provider_navbar.dart';
import '../../widgets/bottom_navbar/user_navbar.dart';
import '../add_item_screen/add_item_screen.dart';
import '../profile/user_profile.dart';
import '../search_screen/search_page.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final NavBarController navBarController = Get.put(NavBarController());
  // final int _currentIndex = 0;
  bool isProvider = true;

  final List<Widget> _tabs = [
    HomeScreen(),
    SearchScreen(),
    FavoritesScreen(),
    ProfileScreen(),
    SeeMore(seeMoreImagePaths: const [
      'assets/images/flower.jpeg',
      'assets/images/flower.jpeg',
      'assets/images/flower.jpeg',
      'assets/images/flower.jpeg',
      // Add more image paths as needed
    ]),
  ];

  final List<Widget> _provider_tabs = [
    HomeScreen(),
    SearchScreen(),
    AddItemScreen(),
    FavoritesScreen(),
    ProfileScreen(),
    SeeMore(seeMoreImagePaths: const [
      'assets/images/flower.jpeg',
      'assets/images/flower.jpeg',
      'assets/images/flower.jpeg',
      'assets/images/flower.jpeg',
      // Add more image paths as needed
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 242, 238, 1.0),
        leading: Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: SvgPicture.asset(
            'assets/icons/Logo.svg',
          ),
        ),
        actions: <Widget>[
          Ink(
            height: 43,
            width: 43,
            decoration: const ShapeDecoration(
              color:
                  Color.fromRGBO(133, 88, 111, 1.0), // Set the background color
              shape: CircleBorder(), // Make the background circular
            ),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Color.fromRGBO(255, 242, 238, 1.0),
              ),
              tooltip: 'Go to the next page',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
            ),
          ),
          SizedBox(width: 10),
          Ink(
            height: 43,
            width: 43,
            decoration: const ShapeDecoration(
              color:
                  Color.fromRGBO(133, 88, 111, 1.0), // Set the background color
              shape: CircleBorder(), // Make the background circular
            ),
            child: IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Color.fromRGBO(255, 242, 238, 1.0),
              ),
              tooltip: 'Go to the next page',
              onPressed: () {},
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      backgroundColor: Color.fromRGBO(255, 242, 238, 1.0),

      // body: _tabs[navBarController.selectedPage.value],
      body: Obx(() {
        if (isProvider == true) {
          return _provider_tabs[navBarController.selectedPage.value];
        } else {
          return _tabs[navBarController.selectedPage.value];
        }
      }),
      bottomNavigationBar: _buildBottomBar(context, isProvider),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SearchPage();
  }
}

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return wishList();
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserProfile();
  }
}

Widget _buildBottomBar(BuildContext context, bool isProvider) {
  if (isProvider == true) {
    return ProviderBottomNavBar();
  } else {
    return UserBottomNavBar();
  }
}
