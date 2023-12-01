import 'package:flutter/material.dart';
import 'package:gifty/presentation/home/homeWidgets.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/config/font.config.dart';

class SeeMore extends StatelessWidget {
  final List<String> seeMoreImagePaths; // Add a list of image paths for the HomeItems

  SeeMore({required this.seeMoreImagePaths});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor:  Color.fromRGBO(255, 242, 238, 1.0),
      body:
        RawScrollbar(
                    thumbColor: AppColor.greenLighter,
                    radius: Radius.circular(20),
                    thickness: 10,
                    trackVisibility:true,
                    thumbVisibility: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to the previous page
                    },
                    child: Icon(Icons.arrow_back), 
                    style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(5),
                    backgroundColor: AppColor.mainLighter,
                    foregroundColor: Colors.white, 
                  ),
                  ),
                ),
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                  padding:  EdgeInsets.symmetric( vertical:3.0 , horizontal: 10.0),
                  child: Text(
                         "Find the best Gift",
                          style:  TextStyle(
                                  shadows: [
                                    Shadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.3), // You can change the shadow color
                                      offset: Offset(1.0, 3.0), // You can change the shadow offset
                                      blurRadius: 5.0, // You can change the blur radius
                                    ),
                                  ],
                                  fontSize: 24,
                                  fontFamily: 'Luxembourg',
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.mainLighter, 
                                  )
                          ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8.0, // Adjust the spacing between cards
                  runSpacing: 8.0,
                  children: [
                    // Create HomeItem widgets using the seeMoreImagePaths
                    for (String imagePath in seeMoreImagePaths)
                      HomeItem(imagePath: imagePath , size: 120  , border: 8.0,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
