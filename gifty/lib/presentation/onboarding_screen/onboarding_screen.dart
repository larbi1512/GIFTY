import 'package:flutter/material.dart';
import 'package:gifty/config/assets.config.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/config/font.config.dart';
import 'package:gifty/presentation/onboarding_screen/intro_page_1.dart';
import 'package:gifty/presentation/onboarding_screen/intro_page_2.dart';
import 'package:gifty/presentation/onboarding_screen/intro_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>  with TickerProviderStateMixin {
  // controller to keep track of which page we're on :3
  PageController _controller = PageController();

  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    _fadeController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        
        
          PageView(
            controller: _controller,
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),

          // Overlay with logo and welcome text
          Positioned(
            top: 50, 
            left: 16, 
            right: 0, 
            child: Container(
              padding: EdgeInsets.only(right:200, top: 50),
              child: Column(
                children: [
                   Text(
                    'Welcome to ',
                    style: AppTextStyles.welcomeText,
                  ),
                    SizedBox(width: 8),
              Hero(
                tag: 'logoHero',
                 child: FadeTransition(
                  opacity: _fadeController,
                 child: Image.asset(
                    Assets.images.logoWhite,
                    height: 60,
                    width: 90,
                   ),
                    ),
                  ),
                 
                ],
              ),
            ),
          ),
          //dot indicators
          Container(
            alignment: Alignment(0, 0.6),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: AppColor.greenMain,
                dotColor: AppColor.greenLighter.withOpacity(0.7),
                dotHeight: 12,
                dotWidth: 12,
                spacing: 10,
                expansionFactor: 4,
              ),
            ),
          ),
          // Buttons at the bottom center
          Align(
            alignment: Alignment.bottomCenter,
          
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text('Create an account',
                      style: AppTextStyles.ButtonText,
                      textAlign: TextAlign.center,
                    ),
                    
                    style: ElevatedButton.styleFrom(                      
                      side: BorderSide(width: 2.0, color: AppColor.peach),
                      onPrimary: AppColor.peach,
                      onSurface: AppColor.peach,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      minimumSize: Size(300, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),

                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child:  Text('Login',
                      style: AppTextStyles.ButtonText,
                      textAlign: TextAlign.center),
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.peach,
                      minimumSize: Size(300, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
