import 'package:flutter/material.dart';
import 'package:gifty/config/assets.config.dart';
import 'package:gifty/widgets/background_image.dart';
import '../../../config/colors.config.dart';
import '../../../config/font.config.dart';
import '../../../providers/id_provider.dart';
import '../../../widgets/rounded_container.dart';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import '../../../models/index.dart';
import '../../../constants/endpoints.dart';
import '../../../providers/role_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> loginUser() async {
    setState(() {
      isLoading = true;
    });

    final String email = emailController.text;
    final String password = passwordController.text;

    // Validate email and password
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter both email and password'),
          backgroundColor: Colors.red,
        ),
      );
      setState(() {
        isLoading = false;
      });
      return;
    }

    final Map<String, String> data = {
      'email': email,
      'password': password,
    };

    try {
      final response = await http.post(
        Uri.parse(api_endpoint_user_login),
        body: data,
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Successful login
        final Map<String, dynamic> responseData = json.decode(response.body);
        print(responseData);

        String role = responseData['data']['role'];
        int id = responseData['data']['user_id'];
        Provider.of<RoleProvider>(context, listen: false).setRole(role);
        Provider.of<IdProvider>(context, listen: false).setId(id);
        // Navigate to the home screen or perform any other actions
        Navigator.pushNamed(context, '/home');
      } else {
        // Handle errors
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
      print('Error during login: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred during login'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        imagePathTopRight: Assets.images.flowersUpper,
        imagePathBottomLeft: Assets.images.flowersLower,
        logoPath: Assets.images.mainLogo,
        child: Center(
          child: RoundedContainer(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                Text(
                  'Login',
                  style: AppTextStyles.loginText,
                ),
                SizedBox(height: 20),
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
                SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.mainLighter,
                    onPrimary: Colors.white,
                    minimumSize: Size(250, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    isLoading ? null : loginUser();
                  },
                  child: Text('Login'),
                ),
                if (isLoading)
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(AppColor.main),
                    backgroundColor: Colors.grey[300],
                  ),
                TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password?'),
                  style: TextButton.styleFrom(
                    primary: AppColor.mainLighter,
                    textStyle: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.mainLighter,
                    ),
                    padding: EdgeInsets.only(left: 100),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account? ',
                        style: AppTextStyles.loginText2,
                      ),
                      Text(
                        'Sign up here',
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
      ),
    );
  }
}
