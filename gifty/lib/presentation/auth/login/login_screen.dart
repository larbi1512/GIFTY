import 'package:flutter/material.dart';
import 'package:gifty/config/assets.config.dart';
import 'package:gifty/widgets/background_image.dart';
import '../../../config/colors.config.dart';
import '../../../config/font.config.dart';
import '../../../widgets/rounded_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  String errorMessage = '';
   Future<void> signIn() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      print('Login Successful: ${userCredential.user?.uid}');
      Navigator.pushNamed(context, '/home');
    } catch (e) {
      print('Login Failed: $e');
      setState((){
       errorMessage = 'Login failed. Please check your credentials.';

      });
    }
  }
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
         if (errorMessage.isNotEmpty)
         Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      errorMessage,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
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
                    obscureText: _isObscure3,
                    
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon:
                          Icon(Icons.lock_rounded, color: AppColor.main),
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                           setState(() {
                            _isObscure3 = !_isObscure3;
                          });
                        },
                        icon: Icon(_isObscure3
                            ? Icons.visibility
                            : Icons.visibility_off),
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
signIn();                 
 },
                  child: Text('Login'),
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
