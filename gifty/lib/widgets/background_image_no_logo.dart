import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';

class BackgroundImageNoLogo extends StatelessWidget {
  final String imagePathTopRight;
  final String imagePathBottomLeft;
  final Widget child;

  BackgroundImageNoLogo({
    required this.imagePathTopRight,
    required this.imagePathBottomLeft,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        //add backgroundcolor
        Container(
          color: AppColor.peachLighter,
        ),

        Image.asset(
          imagePathTopRight,
          alignment: Alignment(1.3, -1.0),
          height: MediaQuery.of(context).size.height * .50,
          width: MediaQuery.of(context).size.width * .50,
        ),
        Image.asset(
          imagePathBottomLeft,
          alignment: Alignment(-1.2, 1.1),
        ),

        child,
      ],
    );
  }
}
