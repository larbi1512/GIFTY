import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/config/font.config.dart';
import 'package:gifty/widgets/fields/phone_number_field.dart';
import 'package:gifty/widgets/fields/username_field.dart';
import 'package:gifty/widgets/fields/wilaya_field.dart';
import '../../../config/assets.config.dart';
import '../../../widgets/fields/TagsInput.dart';
import '../../../widgets/background_image.dart';
import '../../../widgets/fields/categoryDropdown.dart';
import '../../../widgets/rounded_container.dart';

class signupProvider extends StatefulWidget {
  @override
  _SignupProviderState createState() => _SignupProviderState();
}

class _SignupProviderState extends State<signupProvider> {
  String selectedCategory = 'Categories';

  @override
  Widget build(BuildContext context) {
      List<String> categories = [
        "Categories",
      'Beauty',
      'Accessories',
      'Home',
      'Babies',
      'Bakery',
      'Clothings',
      'Handicrafts',
      // Add more categories as needed
    ];
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
                        'Define your brand ',
                        style: AppTextStyles.text,
                      ),
                    ),
                    SizedBox(height: 30),
                    //WilayaField(),
                    SizedBox(height: 10),
                    //PhoneNumberField(),
                    SizedBox(height: 10,),
                    //UsernameField(hintText: "Store name"),
                    SizedBox(height: 10,),
                    CategoryDropdown(
                      categories: categories,
                      selectedCategory: selectedCategory,
                      onChanged: (String newValue) {
                        setState(() {
                          selectedCategory = newValue;
                        });
                      },
                    ),
                    TagsInput(),
                    SizedBox(height: 30),
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
                        Navigator.pushReplacementNamed(context, '/finish_signup_provider');
                      },
                      child: Text('Sign up'),
                    ),
                    SizedBox(
                      height: 20,
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