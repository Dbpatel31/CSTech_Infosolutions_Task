import 'package:csteachassignment/Screens/OtpVerificationScreen.dart';
import 'package:csteachassignment/Screens/SigninScreen.dart';
import 'package:csteachassignment/Utils/CustomTextField.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controllers/RegisterController.dart';
import '../Controllers/SendOtpController.dart';
import '../Models/RegisterRequestModel.dart';
import '../Models/SendOtpRequestModel.dart';
import '../Utils/colors.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {

  final RegisterController _controller = Get.put(RegisterController());
  final SendOtpController _otpController = Get.put(SendOtpController());
    var _formKey=GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobilenumberController = TextEditingController();

  bool _isChecked= false;
  final TapGestureRecognizer _tapGestureRecognizer= TapGestureRecognizer();


  bool _isValid=false;
  String _errorMessage = '';

    bool _validatePassword(String password) {
      _errorMessage = '';

      if (password.length < 6) {
        _errorMessage += 'Password must be longer than 6 characters. \n';
      }
      if (!password.contains(RegExp(r'[A-Z]'))) {
        _errorMessage += 'Uppercase letter is missing .\n';
      }
      if (!password.contains(RegExp(r'[a-z]'))) {
        _errorMessage += 'Lowercase letter is missing .\n';
      }
      if (!password.contains(RegExp(r'[0-9]'))) {
        _errorMessage += 'Digit is misssing. \n';
      }
      if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
        _errorMessage += 'Special character is missing.\n';
      }
      return _errorMessage.isEmpty;
    }

    void _submit() {
      final isValid = _formKey.currentState!.validate();

      if (!isValid) {
        return;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Successfully signup",
              style: TextStyle(color: Colors.white),
            )));
      }
      _formKey.currentState!.save();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.appbackground,
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    final screenWidth= MediaQuery.of(context).size.width;
    final screenHeight= MediaQuery.of(context).size.height;

    return SafeArea(
        child: Column(
          children: [
            SizedBox(height: screenHeight*0.03),
            Center( child: Image.asset("assets/images/logo.png")),
            SizedBox(height: screenHeight*0.02),

            Expanded(
              child: SizedBox(
                width: screenWidth,

                child: Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: AppColors.borders,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
                  ),
                  color: AppColors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.03,
                      vertical: screenHeight * 0.03,
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                           mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Welcome!",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: screenWidth * 0.091,
                                color: AppColors.black,
                              ),
                            ),
                            Text(
                              "Please register to continue",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 0.042,
                                color: AppColors.gray,
                              ),
                            ),
                         SizedBox(height: screenHeight*0.02,),
                         Padding(
                           padding: EdgeInsets.symmetric(horizontal: screenWidth*0.05),
                             child: Card(
                                 shape: RoundedRectangleBorder(
                                   side: BorderSide(
                                     color: AppColors.borders,
                                     width: 1.0,
                                   ),
                                   borderRadius: BorderRadius.circular(12.0),
                                 ),
                                 color: AppColors.white,
                                 child: CustomTextFormField(hintText: "Name", prefixImagePath: "assets/images/contact.png",controller: _fullNameController, validator: (value){
                                   if (value!.isEmpty) {
                                     return 'Enter A Valid Full Name';
                                   }
                                   return null;
                                 },))),

                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: screenWidth*0.05),
                                child: Card(
                                 
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: AppColors.borders,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    color: AppColors.white,
                                    child: CustomTextFormField(hintText: "Email address", prefixImagePath: "assets/images/mail.png", controller: _emailController,  validator: (value) {
                                      if (value!.isEmpty ||
                                          value == null ||
                                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(value)) {
                                        return 'Enter A Valid Email';
                                      }
                                      return null;
                                    },))),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: screenWidth*0.05),
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: AppColors.borders,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    color: AppColors.white,
                                    child: CustomTextFormField(hintText: "Password", prefixImagePath: "assets/images/lock.png", controller: _passwordController,  validator: (value) {
                                      if (value!.isEmpty || value == null) {
                                        return 'Enter A Valid Password';
                                      }
                                      if (!_validatePassword(value)) return _errorMessage;
                                      return null;
                                    },))),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: screenWidth*0.05, ),
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: AppColors.borders,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    color: AppColors.white,
                                    child: CustomTextFormField(hintText: "+91", prefixImagePath: "assets/images/whatsapp.png",suffixImagePath: "assets/images/india.png", controller: _numberController, validator: (value) {
                                      if (value!.isEmpty || value == null) {
                                        return 'Enter A Valid Number';
                                      }
                                      return null;
                                    },))),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: screenWidth*0.05, ),
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: AppColors.borders,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    color: AppColors.white,
                                    child: CustomTextFormField(hintText: "Mobile Number", prefixImagePath: "assets/images/phone.png",controller: _mobilenumberController, validator: (value) {
                                      if (value!.isEmpty || value == null) {
                                        return 'Enter A Valid Number';
                                      }
                                      return null;
                                    },))),
                            SizedBox(height: screenHeight * 0.015),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: screenWidth*0.03),
                              child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  StatefulBuilder(
                                      builder: (context, setState)=>Theme(
                                        data: Theme.of(context).copyWith(
                                          checkboxTheme: CheckboxThemeData(
                                            side: BorderSide(
                                              color: AppColors.borders,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        child: Checkbox(
                                            value: _isChecked,
                                            onChanged: (value){
                                              setState((){
                                                _isChecked= value ?? false;
                                              });
                                            },

                                        ),
                                      )
                                  ),
                                  Expanded(
                                      child: RichText(
                                          text: TextSpan(
                                            text: 'I agree to the ',
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: screenWidth*0.041,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.black
                                            ),
                                            children:[
                                              TextSpan(
                                                text: 'Terms and Conditions',
                                                style: TextStyle(
                                                  color: AppColors.blue,
                                                ),
                                                recognizer: _tapGestureRecognizer
                                                  ..onTap = () {
                                                    // Navigate or show terms page
                                                    print("Terms clicked");
                                                  },
                                              )
                                            ]
                                          )
                                      )
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenHeight*0.02,
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=> Signinscreen(email: _emailController.text, password: _passwordController.text, name: _fullNameController.text,))
                                );
                              },
                              child: Center(
                                child: RichText(
                                    text: TextSpan(
                                      text: "Already have an account?",
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: screenWidth*0.041,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black
                                    ),
                                       children: [
                                         TextSpan(
                                           text: "Sign In",
                                           style: TextStyle(
                                             color: AppColors.blue
                                           )
                                         )
                                       ]
                                    )
                                )
                              ),
                            ),
                            SizedBox(height: screenHeight*0.015,),
                            SizedBox(
                              width: double.infinity,
                              height: screenHeight * 0.06,
                              child: ElevatedButton(
                                onPressed: _isValid ?null : () async{
                                  if (_formKey.currentState!.validate()) {
                                    final request = RegisterRequestModel(
                                      username: _fullNameController.text.trim(),
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim(),
                                    );

                                    await _controller.registerUser(request);

                                    final otpRequest = SendOtpRequestModel(
                                      email: _emailController.text.trim(),
                                    );

                                    await _otpController.sendOtp(otpRequest);


                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Otpverificationscreen(email: _emailController.text,phonenumber: _mobilenumberController.text, name: _fullNameController.text,)),
                                    );
                                  }


                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    fontSize: screenWidth * 0.04,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        )
    );
  }
}
