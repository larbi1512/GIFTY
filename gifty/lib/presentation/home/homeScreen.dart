import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gifty/presentation/home/SeeMore.dart';
import 'package:gifty/presentation/home/homeWidgets.dart';

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
  int _currentIndex = 0;
  
  final List<Widget> _tabs = [
    HomeScreen(),
    SearchScreen(),
    FavoritesScreen(),
    ProfileScreen(),
    SeeMore(seeMoreImagePaths:  const [
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
        actions:  <Widget>  [
         Ink(
          height : 43,
          width: 43,
          decoration: const ShapeDecoration(
          color: Color.fromRGBO(133, 88, 111, 1.0), // Set the background color
          shape: CircleBorder(), // Make the background circular
          ),
          child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Color.fromRGBO(255, 242, 238, 1.0),
                ),
                tooltip: 'Go to the next page',
                onPressed: () {
                },
              ),
          ),
           SizedBox(width: 10),
         Ink(
          height : 43 ,
          width: 43,
          decoration: const ShapeDecoration(
          color: Color.fromRGBO(133, 88, 111, 1.0), // Set the background color
          shape: CircleBorder(), // Make the background circular
          ),
          child: IconButton(
                icon: const Icon(
                Icons.notifications,
                color: Color.fromRGBO(255, 242, 238, 1.0),
              ),
              tooltip: 'Go to the next page',
              onPressed: () {
              },
            ),
          ),
           SizedBox(width: 10),
      ],
      ),
      backgroundColor: Color.fromRGBO(255, 242, 238, 1.0),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Color.fromRGBO(133, 88, 111, 1.0),
        unselectedItemColor: Colors.black,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}


class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Search Screen'),
    );
  }
}
class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Favorites Screen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Screen'),
    );
  }
}
