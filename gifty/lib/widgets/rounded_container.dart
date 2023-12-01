import 'dart:ui';

import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;

  RoundedContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: 300,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white60,
                Colors.white10,
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 2, color: Colors.white30),
          ),
          child: child,
        ),
      ),
    );
  }
}
