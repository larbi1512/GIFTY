import 'package:flutter/material.dart';
import 'presentation/splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      initialRoute: '/splash', // Initial route can be your splash screen
      routes: {
        '/splash': (context) => SplashScreen(),
        // Add other routes here
      },
    );
  }
}
