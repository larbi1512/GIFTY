import 'package:flutter/material.dart';

class WhiteBlurryBackground extends StatelessWidget {
  final double height;
  final Widget child;

  WhiteBlurryBackground({
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 17),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 250, 250, 0.7),
          borderRadius: BorderRadius.circular(20),
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.white.withOpacity(0.7),
          //       blurRadius: 20,
          //       blurStyle: BlurStyle.inner),
          // ],
        ),
        child: child);
  }
}
