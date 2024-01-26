import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gifty/config/colors.config.dart';

import '../controllers/add_item_controller.dart';

class SearchWidget extends StatelessWidget {
  ScrollController scrollController = ScrollController();
  final String title;
  final bool additional;
  SearchWidget(this.title, this.additional, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      decoration: BoxDecoration(
        color: additional
            ? Color.fromRGBO(133, 88, 111, 0.25)
            : Color.fromRGBO(222, 182, 171, 0.4),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: additional ? AppColor.main : AppColor.mainLighter,
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Set the alignment to start
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "$title: ",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: additional ? AppColor.main : AppColor.mainLighter,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 0, 0, 10),
            child: RawScrollbar(
              controller: scrollController,
              trackColor: AppColor.mainLighter,
              thumbColor: AppColor.greenMain,
              thumbVisibility: true,
              trackVisibility: true,
              thickness: 8, // Set the thickness of the scrollbar track
              radius: Radius.circular(5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: scrollController,
                child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                    child: Row(
                      children: () {
                        switch (title) {
                          case 'Event type':
                            return <Widget>[
                              Tag("Birthday", title),
                              Tag("Anniversary", title),
                              Tag("Holiday", title),
                              Tag("Mother’s day", title),
                              Tag("Special Event", title),
                              Tag("Wedding", title),
                              Tag("Graduation", title),
                              Tag("Baby Shower", title),
                              Tag("other", title),
                            ];
                          case 'Gift’s receiver':
                            return <Widget>[
                              Tag("Male", title),
                              Tag("Female", title),
                              Tag("formal relative", title),
                              Tag("friend", title),
                              Tag("Mother", title),
                              Tag("Father", title),
                              Tag("sister", title),
                              Tag("brother", title),
                              Tag("son", title),
                              Tag("doghter", title),
                              Tag("other", title),
                            ];
                          case 'prefered color':
                            return <Widget>[
                              Tag("dark", title),
                              Tag("light", title),
                              Tag("white", title),
                              Tag("black", title),
                              Tag("grey", title),
                              Tag("pink", title),
                              Tag("yellow", title),
                              Tag("red", title),
                              Tag("green", title),
                              Tag("blue", title),
                              Tag("other", title),
                            ];
                          case 'Receiver’s age':
                            return <Widget>[
                              Tag("younger than 5 yo", title),
                              Tag("5-10", title),
                              Tag("10-15", title),
                              Tag("15-20", title),
                              Tag("20-30", title),
                              Tag("30-40", title),
                              Tag("40-60", title),
                              Tag("more than 60 yo", title),
                            ];
                          default: //additional tags
                            return <Widget>[
                              Tag("Handmade", title),
                              Tag("Personalized", title),
                              Tag("Eco-friendly", title),
                              Tag("Organic", title),
                              Tag("Gift Wrap Available", title),
                            ];
                        }
                      }(),
                    )),
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
  final String title;
  static final AddItemController addController = Get.put(AddItemController());

  const Tag(this.label, this.title, {Key? key}) : super(key: key);

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
          backgroundColor: isClicked
              ? Color.fromRGBO(172, 125, 136, 0.4)
              : Color.fromRGBO(245, 244, 251, 1.0),
          foregroundColor: AppColor.main,
          side: BorderSide(
            color: isClicked
                ? AppColor.main
                : AppColor.mainLighter, // Border color
            width: 1.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Border radius
          ),
        ),
        onPressed: () {
          setState(() {
            isClicked = !isClicked;
            print(" ${widget.title} ${widget.label} $isClicked");
            if (isClicked == true) {
              print(" clicked");
              Tag.addController.doAddInTag(widget.title, widget.label);
            } else {
              print(" not clicked");
              Tag.addController.doRemoveInTag(widget.title, widget.label);
            }
          });
        },
        child: Text(
          widget.label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isClicked ? AppColor.main : AppColor.mainLighter,
          ),
        ),
      ),
    );
  }
}
