import 'package:flutter/material.dart';
import 'package:gifty/presentation/auth/login/login_screen.dart';
import 'package:gifty/presentation/auth/sign_up/finish_signup_user.dart';
import 'package:gifty/presentation/auth/sign_up/signup1.dart';
import 'package:gifty/presentation/auth/sign_up/signup_provider.dart';
import 'package:gifty/presentation/auth/sign_up/signup_user.dart';
import 'package:gifty/presentation/onboarding_screen/onboarding_screen.dart';
import 'presentation/card_screen/card_screen.dart';
import 'presentation/providers_list/providers_list_screen.dart';
import 'presentation/splash_screen/splash_screen.dart';
import 'package:gifty/presentation/home/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Flutter App',
      initialRoute: '/splash', // Initial route can be your splash screen
      routes: {
        '/splash': (context) => SplashScreen(),
        '/card': (context) => CardScreen(),
        '/providers': (context) => ProvidersList(),
        '/home': (context) => Home(),
        '/onboarding': (context) => OnBoardingScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => signup1(),
        '/signup_provider': (context) => signupProvider(),
        '/signup_user': (context) => signupUser(),
        '/finish_signup_user': (context)=> const signupUserfinal(),

      },
    );
  }
}
