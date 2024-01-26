import 'package:flutter/material.dart';
import 'package:gifty/config/colors.config.dart';
import 'package:gifty/config/font.config.dart';
import 'package:gifty/constants/endpoints.dart';
import 'package:gifty/widgets/fields/phone_number_field.dart';
import 'package:gifty/widgets/fields/username_field.dart';
import 'package:gifty/widgets/fields/wilaya_field.dart';
import '../../../config/assets.config.dart';
import '../../../widgets/background_image.dart';
import '../../../widgets/rounded_container.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class signupUser extends StatefulWidget {
   @override
  _SignupUserState createState() => _SignupUserState();
}
class _SignupUserState extends State<signupUser> {
  
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController wilayaController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
bool isLoading = false;


  Future<void> signupUserPart1(String userId) async {
    setState(() {
      isLoading = true;
    });

    final String name = nameController.text;
    final String surname = surnameController.text;
    final String username = usernameController.text;
    final String wilaya = wilayaController.text;
    final String phoneNumber = phoneNumberController.text;

    
    final Map<String, String> data = {
      'user_id': userId,
      'name': name,
      'surname': surname,
      'username': username,
      'wilaya': wilaya,
      'phone_number': phoneNumber,
    };

    try {
      final response = await http.post(
       Uri.parse(api_endpoint_user_signup_1,),
        body: data,
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Successful signup part 1
        final Map<String, dynamic> responseData = json.decode(response.body);
        print(responseData);
        // Navigate to the next screen or perform any other actions
        Navigator.pushReplacementNamed(context, '/finish_signup_user');
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
      print('Error during signup part 1: $e');
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
                    //add two textFields in a row
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .35,
                          padding: EdgeInsets.only(left: 20, ),
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person_2_rounded,
                                  color: AppColor.main),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Name',
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.main),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                          
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .35,
                          padding: EdgeInsets.only(
                            right: 10,
                            left : 5,
                          ),
                          child: TextField(
                            controller: surnameController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person_2_rounded,
                                  color: AppColor.main),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Surname',
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.main),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(4),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                     UsernameField(hintText: "enter your username",
                      controller: usernameController,),
                      SizedBox(height: 10,),
                      WilayaField(
                        controller: wilayaController,
                      ),
                      SizedBox(height: 10,),
                      PhoneNumberField(
                        controller: phoneNumberController,
                      ),
                      SizedBox(height: 30,),
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
                       isLoading ? null : signupUserPart1(ModalRoute.of(context)!.settings.arguments.toString());

                      },
                      child: Text('Sign up'),
                    ),
                    SizedBox(height: 20,),

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
