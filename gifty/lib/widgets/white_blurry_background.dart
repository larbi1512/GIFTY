import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

class WhiteBlurryBackground extends StatelessWidget {
  final double height;
  final Widget child;

  WhiteBlurryBackground({
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      blur: 3,
      height: height,
      elevation: 0,
      color: Colors.white.withOpacity(0.4),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 17),
      borderRadius: BorderRadius.circular(20),
      child: child,
    );
  }
}
