import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/widgets/favorite_item.dart';

class wishList extends StatefulWidget {
  const wishList({Key? key}) : super(key: key);

  @override
  State<wishList> createState() => _wishlistState();
}

class _wishlistState extends State<wishList> {
  @override
  Widget build(BuildContext context) {
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
                    trackVisibility:true,
                    thumbVisibility: true,
              child: SingleChildScrollView(
                child:
                    buildGridView(), 
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGridView() {
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
      itemCount: 8, // Change this to the number of items you want to display
      itemBuilder: (BuildContext context, int index) {
        return LikedItemWidget(imagePath:   'assets/images/gift.jpeg' , isinFav: true);
      },
    );
  }
}
