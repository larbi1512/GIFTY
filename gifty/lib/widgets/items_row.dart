import 'package:flutter/material.dart';
import 'package:gifty/presentation/card_screen/card_screen.dart';

class ItemsRow extends StatelessWidget {
  final List<Map> items;
  const ItemsRow({
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ItemCell(
              Item_imagePath: items[index]['Item_imagePath'],
              Item_name: items[index]['Item_name'],
              Item_isFavorite: items[index]['Item_isFavorite'],
              Item_description: items[index]['Item_description'],
            ),
          );
        },
      ),
    );
  }
}

class ItemCell extends StatelessWidget {
  final String Item_imagePath;
  final String Item_name;
  final bool Item_isFavorite;
  final String Item_description;

  ItemCell(
      {required this.Item_imagePath,
      required this.Item_name,
      required this.Item_isFavorite,
      required this.Item_description,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
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
      child: GestureDetector(
        onTap: () {
          itemSelected(context);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              8.0), // Use the same radius as in the box decoration
          child: Image.asset(
            Item_imagePath,
            fit: BoxFit.cover,
            width: 90,
            height: 90,
          ),
        ),
      ),
    );
  }

  void itemSelected(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CardScreen(),
      ),
    );
  }
}
