import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';


class SearchWidget extends StatelessWidget {

  final String title;
  final bool additional ; 
  const SearchWidget( this.title , this.additional , {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0 , vertical: 10),
      decoration: BoxDecoration(
        color:  additional ? Color.fromRGBO(133, 88, 111, 0.25) : Color.fromRGBO(222, 182, 171, 0.4) ,
        borderRadius: BorderRadius.circular(8.0),
         border: Border.all(
          color: additional ? AppColor.main : AppColor.mainLighter, 
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Set the alignment to start
        children: [
          Padding(
               padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
                   title,
                    style:  TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: additional ? AppColor.main : AppColor.mainLighter, 
                    ),
                  ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB( 5, 0, 0, 10),
            child: RawScrollbar(
               trackColor: AppColor.mainLighter,
               thumbColor: AppColor.greenMain,
               thumbVisibility: true,
               trackVisibility: true,
               thickness: 8, // Set the thickness of the scrollbar track
               radius: Radius.circular(5),
              child: SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                child: Container(
                   margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: Row(
                    children: [
                      Tag("Mother’s day"),
                      Tag("Birthday"),
                      Tag("Anniversary"),
                      Tag("Holiday"),
                      Tag("Special Event"),
                      Tag("Wedding"),
                      Tag("Graduation"),
                      Tag("Baby Shower"),
                      Tag("Graduation"),
                      Tag("Baby Shower"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Tag extends StatefulWidget {
  final String label;

  const Tag(this.label, {Key? key}) : super(key: key);

  @override
  _TagState createState() => _TagState();
}

class _TagState extends State<Tag> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
          backgroundColor: isClicked ? Color.fromRGBO(172, 125, 136, 0.4) : Color.fromRGBO(245, 244, 251, 1.0),
          foregroundColor: AppColor.main,
          side: BorderSide(
            color: isClicked? AppColor.main :  AppColor.mainLighter, // Border color
            width: 1.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Border radius
          ),
        ),
        onPressed: () {
          setState(() {
            isClicked = !isClicked;
          });
        },
        child: Text(
          widget.label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isClicked? AppColor.main :  AppColor.mainLighter,
          ),
        ),
      ),
    );
  }
}
