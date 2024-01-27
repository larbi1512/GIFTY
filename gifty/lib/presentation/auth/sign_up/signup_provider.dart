import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/config/font.config.dart';
import 'package:gifty/widgets/fields/phone_number_field.dart';
import 'package:gifty/widgets/fields/username_field.dart';
import 'package:gifty/widgets/fields/wilaya_field.dart';
import '../../../config/assets.config.dart';
import '../../../widgets/background_image.dart';
import '../../../widgets/fields/categoryDropdown.dart';
import '../../../widgets/rounded_container.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../constants/endpoints.dart';


class signupProvider extends StatefulWidget {
  @override
  _SignupProviderState createState() => _SignupProviderState();
}

class _SignupProviderState extends State<signupProvider> {
  String selectedCategory = 'Categories';
  final TextEditingController storenameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  bool isLoading = false;
  
  
  Future<void> signupProviderPart1(String providerId) async {
    setState(() {
      isLoading = true;
    });

    final String storename = storenameController.text;
    final String location = locationController.text;
    final String phoneNumber = phoneNumberController.text;
    final String selectedCategory = this.selectedCategory;


     final Map<String, String> data = {
      'provider_id': providerId,
      'store_name': storename,
      'location': location,
      'phone_number': phoneNumber,
      'category': selectedCategory,
    };
    try {
      final response = await http.post(
       Uri.parse(api_endpoint_provider_signup_1,),
        body: data,
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    
     if (response.statusCode == 200) {
        // Successful signup part 1
        final Map<String, dynamic> responseData = json.decode(response.body);
        print(responseData);
        // Navigate to the next screen or perform any other actions
        Navigator.pushReplacementNamed(context, '/finish_signup_provider', arguments: providerId);
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
    } catch (e, stack) {
      print('Error during signup part 1: $e $stack');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred during signup part 1'),
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
      List<String> categories = [
      "Categories",
      'Beauty',
      'Accessories',
      'Home',
      'Babies',
      'Bakery',
      'Clothings',
      'Handicrafts',
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
                    WilayaField(controller: locationController,),
                    SizedBox(height: 10),
                    PhoneNumberField(controller: phoneNumberController,),
                    SizedBox(height: 10,),
                    UsernameField(hintText: "Store name", controller: storenameController,),
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
                        isLoading? null: signupProviderPart1(ModalRoute.of(context)!.settings.arguments.toString());
                      },
                      child: Text('Sign up'),
                    ),
                    if (isLoading)
                      CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColor.main),
                        backgroundColor: Colors.grey[300],
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