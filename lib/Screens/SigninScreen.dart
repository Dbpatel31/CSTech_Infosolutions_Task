import 'package:csteachassignment/Controllers/LoginController.dart';
import 'package:csteachassignment/Models/LoginRequestModel.dart';
import 'package:csteachassignment/Screens/CallingScreen.dart';
import 'package:csteachassignment/Utils/CustomTextField.dart';
import 'package:csteachassignment/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Signinscreen extends StatefulWidget {
  final String email;
  final String password;
  final String name;
  const Signinscreen({super.key, required this.email, required this.password, required this.name});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {

  final LoginContoller _controller = Get.put(LoginContoller());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                child:SizedBox(
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Welcome",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: screenWidth * 0.091,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            "Please sign-in to continue",
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
                            padding: EdgeInsets.symmetric(horizontal: screenWidth*0.06),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: screenWidth * 0.042,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight*0.3,),
                          RichText(
                              text: TextSpan(
                                  text: "Don't have an account?",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: screenWidth*0.041,
                                      color: AppColors.black
                                  ),
                                  children:[
                                    TextSpan(
                                      text: "Sign Up",
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          fontSize: screenWidth*0.041,
                                          color: AppColors.blue
                                      ),
                                    )
                                  ]
                              )
                          ),
                          SizedBox(height: screenHeight*0.01,),
                          SizedBox(
                            width: double.infinity,
                            height: screenHeight * 0.06,
                            child: ElevatedButton(
                              onPressed: () async{
                                final loginRequest= LoginRequestModel(
                                    email: widget.email,
                                    password: widget.password
                                );

                                await _controller.registerUser(loginRequest);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Callingscreen(name: widget.name, email: widget.email,)),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Sign In",
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

                    )
                  ),
                )
            )
          ],
        )
    );
  }

}

