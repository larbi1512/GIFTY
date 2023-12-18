import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/config/font.config.dart';

import '../../../config/assets.config.dart';
import '../../../widgets/background_image.dart';
import '../../../widgets/rounded_container.dart';
import '../../../widgets/toggle_button.dart';
import 'package:firebase_auth/firebase_auth.dart';


class signup1 extends StatefulWidget {
  @override
  _Signup1State createState() => _Signup1State();
}

class _Signup1State extends State<signup1> {
  bool isUserSelected = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void toggleCallback(bool selected) {
    setState(() {
      isUserSelected = selected;
    });
  }
  @override
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        imagePathTopRight: Assets.images.flowersUpper,
        imagePathBottomLeft: Assets.images.flowersLower,
        logoPath: Assets.images.mainLogo,
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .25,
                  left: MediaQuery.of(context).size.width * .08),
              child: RoundedContainer(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Sign Up',
                        style: AppTextStyles.loginText,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'join to find your favorite flowers and gifts',
                        style: AppTextStyles.text,
                      ),
                    ),
                    SizedBox(height: 20),
                    ToggleButton(
                      onToggle: toggleCallback,
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.email_rounded, color: AppColor.main),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Email',
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.main),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon:
                              Icon(Icons.lock_rounded, color: AppColor.main),
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.visibility_off_rounded),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.main),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon:
                              Icon(Icons.lock_rounded, color: AppColor.main),
                          hintText: 'Confirm Password',
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.visibility_off_rounded),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.main),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColor.mainLighter,
                        onPrimary: Colors.white,
                        minimumSize: Size(250, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () async {
                        try {
                          if (!isValidEmail(emailController.text)) {
                            print('Invalid email address format');
                            // Handle invalid email format (show error message, etc.)
                            } else if (passwordController.text !=
                              passwordController.text) {
                            print('Passwords do not match');
                            // Handle password mismatch (show error message, etc.)
                            return;
                          }

                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );

                          print(
                              'Signup Successful: ${userCredential.user?.uid}');

                          // TODO: Add logic to save additional user data or navigate to the next screen
                          // based on the user's role (isUserSelected).

                          if (isUserSelected) {
                            // User registration logic (e.g., navigate to '/signup_user')
                            Navigator.pushNamed(context, '/signup_user');
                          } else {
                            // Provider registration logic (e.g., navigate to '/signup_provider')
                            Navigator.pushNamed(context, '/signup_provider');
                          }
                        } catch (e) {
                          print('Signup Failed: $e');
                        }
                      },
                      child: Text('Next'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: AppTextStyles.loginText2,
                          ),
                          Text(
                            'Login here',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColor.main,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  bool isValidEmail(String email) {
   final emailRegex =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }
}
