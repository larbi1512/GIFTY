import 'package:flutter/material.dart';
import '../../config/assets.config.dart';
import '../../config/colors.config.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeController.forward();
  }

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.main, // Set the background color to blue
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: FadeTransition(
                opacity: _fadeController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.images.logoWhite,
                      height: 150,
                      width: 150,
                    ),
                  ],
                ),
              ),
            ),
            // Text at the Bottom
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Copyright Gifty. All rights reserved',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
