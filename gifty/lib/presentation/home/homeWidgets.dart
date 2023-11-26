import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: SearchBarApp(),
            ),
            CategoryRow(
              title: 'gifts',
              imagePaths: [
                'assets/images/pic.jpg',
                'assets/images/pic.jpg',
                'assets/images/pic.jpg',
                'assets/images/pic.jpg',
                // Add more image paths as needed
              ],
            ),
            CategoryRow(
              title: 'flowers',
              imagePaths: [
                'assets/images/flower.jpeg',
                'assets/images/flower.jpeg',
                'assets/images/flower.jpeg',
                'assets/images/flower.jpeg',
                // Add more image paths as needed
              ],
            ),
            CategoryRow(
              title: 'inspirations',
              imagePaths: [
                'assets/images/inspo.jpeg',
                'assets/images/inspo.jpeg',
                'assets/images/inspo.jpeg',
                'assets/images/inspo.jpeg',
                // Add more image paths as needed
              ],
            ),
          ],
        ),
      ),
    );
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
                  // Perform the search here
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
}
 class CategoryRow extends StatelessWidget{
    final String title;
    final List<String> imagePaths;

    const CategoryRow({
    required this.title,
    required this.imagePaths,
    Key? key,
   }) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
            shadows: [
              Shadow(
                color: Color.fromRGBO(0, 0, 0, 0.3), // You can change the shadow color
                offset: Offset(1.0, 3.0), // You can change the shadow offset
                blurRadius: 5.0, // You can change the blur radius
              ),
            ],
            fontSize: 24,
            fontFamily: 'Luxembourg',
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(133, 88, 111, 1.0) ),
            
          ),
        ),
        Container(
          height: 116,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: HomeItem(imagePath: imagePaths[index]),
              );
            },
          ),
        ),
        SizedBox(height: 20.0,)
      ],
    );
  }
 }


class HomeItem extends StatelessWidget {
  final String imagePath;

  const HomeItem({required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
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
        borderRadius: BorderRadius.circular(8.0), // Use the same radius as in the box decoration
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
