import 'package:flutter/material.dart';
import 'package:gifty/config/assets.config.dart';
import 'package:gifty/widgets/background_image.dart';
import '../../../config/colors.config.dart';
import '../../../config/font.config.dart';
import '../../../widgets/rounded_container.dart';

class LoginScreen extends StatelessWidget {
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
                    Navigator.pushNamed(context, '/home');
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
