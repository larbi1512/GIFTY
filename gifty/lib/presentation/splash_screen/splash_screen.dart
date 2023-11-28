import 'package:flutter/material.dart';
import 'package:gifty/config/font.config.dart';
import 'package:gifty/presentation/onboarding_screen/onboarding_screen.dart';
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
    _fadeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
      Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => OnBoardingScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 0.5); 
              const end = Offset.zero;
              const curve = Curves.easeInOut;
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        );
      }
    });
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
                    Hero(
                      tag: 'logoHero',
                    child: Image.asset(
                      Assets.images.logoWhite,
                      height: 150,
                      width: 150,
                      //Add a tag
                    ),
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
                child: 
                Text(
                  ' © Copyright Gifty. All rights reserved',
                  style: AppTextStyles.CopyRightText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
