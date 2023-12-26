import 'package:flutter/material.dart';
import 'package:gifty/presentation/auth/login/login_screen.dart';
import 'package:gifty/presentation/cartScreen/cartPage.dart';
import 'package:gifty/presentation/auth/sign_up/finish_signup_user.dart';
import 'package:gifty/presentation/auth/sign_up/signup1.dart';
import 'package:gifty/presentation/auth/sign_up/signup_provider.dart';
import 'package:gifty/presentation/auth/sign_up/signup_user.dart';
import 'package:gifty/presentation/notificationScreen/notificationPage.dart';
import 'package:gifty/presentation/onboarding_screen/onboarding_screen.dart';
import 'presentation/add_item_screen/add_item_screen.dart';
import 'presentation/auth/sign_up/finish_signup_provider.dart';
import 'presentation/card_screen/card_screen.dart';
import 'presentation/profile/provider_contact.dart';
import 'presentation/profile/user_profile.dart';
import 'presentation/providers_list/providers_list_screen.dart';
import 'presentation/splash_screen/splash_screen.dart';
import 'package:gifty/presentation/home/homeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Flutter App',
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        // '/card': (context) => CardScreen(imagePath: 'assets/images/goods.jpeg' ,),
        '/providers': (context) => ProvidersListPage(),
        '/home': (context) => Home(),
        '/onboarding': (context) => OnBoardingScreen(),
        '/login': (context) => LoginScreen(),

        '/cart': (context) => CartPage(userId: 1,),

        '/signup': (context) => signup1(),
        '/signup_provider': (context) => signupProvider(),
        '/signup_user': (context) => signupUser(),
        '/finish_signup_user': (context) => SignupUserFinal(),
        '/finish_signup_provider': (context) => signupProviderFinal(),

        '/user_profile': (context) => UserProfile(),
        '/provider_contact': (context) => ProviderContact(),
        '/Add_item_screen': (context) => AddItemScreen(),
        '/notifications': (context) => NotificationPage()
      },
    );
  }
}
