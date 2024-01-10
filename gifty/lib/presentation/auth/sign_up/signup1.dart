import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/config/font.config.dart';
import 'package:gifty/constants/endpoints.dart';

import '../../../config/assets.config.dart';
import '../../../widgets/background_image.dart';
import '../../../widgets/rounded_container.dart';
import '../../../widgets/toggle_button.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../models/index.dart';

class signup1 extends StatefulWidget {
   @override
  _Signup1State createState() => _Signup1State();
}
  
  class _Signup1State extends State<signup1> {
  bool isUserSelected = true;
   final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void toggleCallback(bool selected) {
    setState(() {
      isUserSelected = selected;
    });
  }

   Future<void> signup() async {
    final String email = emailController.text;
    final String password = passwordController.text;
    final String confirmPassword = confirmPasswordController.text;

    // Validate email, password, and confirmPassword
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter all required fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Check if passwords match
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Passwords do not match'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Choose the appropriate signup endpoint based on user or provider
    final String signupEndpoint = isUserSelected
        ? api_endpoint_user_signup: api_endpoint_provider_signup;

     try {
      final response = await http.post(
        Uri.parse(signupEndpoint),
        body: {
          'email': email,
          'password': password,
          'confirm_password': confirmPassword,
        },
      );
  print('Signup Response status code: ${response.statusCode}');
      print('Signup Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Successful signup
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String userId = responseData['id'];
        print(responseData);
        // Navigate to the next screen or perform any other actions
        Navigator.pushNamed(context,   isUserSelected ? '/signup_user': '/signup_provider', arguments: userId);
      } else {
        // Handle signup errors
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String errorMessage = responseData['message'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error during signup: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred during signup'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
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
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .25, left: MediaQuery.of(context).size.width * .08),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
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
                          controller: passwordController,
                          obscureText: true,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
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
                          controller: confirmPasswordController,
                          obscureText: true,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
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
                        onPressed: signup,
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
  
}
