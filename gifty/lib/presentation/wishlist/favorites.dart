import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/widgets/favorite_item.dart';

import '../../databases/DBUser_favorites.dart';

class wishList extends StatefulWidget {
  final int user_id;
  const wishList({Key? key, required this.user_id}) : super(key: key);

  @override
  State<wishList> createState() => _wishlistState();
}

class _wishlistState extends State<wishList> {
  @override
  Widget build(BuildContext context) {
    Future<List?> favorites =
        DBUserFavorits.getAllFavoritsOfUser(widget.user_id);
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 242, 238, 1.0),
      body: Column(
        children: [
          Expanded(
            child: RawScrollbar(
              trackColor: AppColor.mainLighter,
              thumbColor: AppColor.greenLighter,
              radius: Radius.circular(20),
              thickness: 10,
              trackVisibility: true,
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: FutureBuilder(
                  future: favorites,
                  builder: _build_grid_favorites,
                ),
                // buildGridView(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _build_grid_favorites(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      List<Map> favorites = snapshot.data as List<Map>;
      return buildGridView(favorites);
      // CategoryRow(
      //   title: 'gifts',
      //   productsList: gifts,
      //   imagePaths: imagePaths,
      // );
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }
    return CircularProgressIndicator();
  }

  Widget buildGridView(productsList) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 6,
        childAspectRatio: 0.7,
      ),
      itemCount:
          productsList.length, // Change this to the number of items you want
      itemBuilder: (BuildContext context, int index) {
        return LikedItemWidget(
            widgetState: this, product: productsList[index], isinFav: true);
      },
    );
  }
}
