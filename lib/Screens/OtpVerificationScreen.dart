import 'package:csteachassignment/Screens/CallingScreen.dart';
import 'package:csteachassignment/Screens/SigninScreen.dart';
import 'package:csteachassignment/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../Controllers/VerifyOtpController.dart';
import '../Models/VerifyOtpRequestModel.dart';

class Otpverificationscreen extends StatefulWidget {
  final String email;
  final String phonenumber;
  final String name;
  const Otpverificationscreen({Key? key, required this.email, required this.phonenumber, required this.name}) : super(key: key);

  @override
  State<Otpverificationscreen> createState() => _OtpverificationscreenState();
}

class _OtpverificationscreenState extends State<Otpverificationscreen> {
  final VerifyOtpController _verifyController = Get.put(VerifyOtpController());
  final List<TextEditingController> _otpControllers =
  List.generate(6, (_) => TextEditingController());
  String email = "";
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
                          width: 1.0
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
                              "Whatsapp OTP\n Verification",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: screenWidth * 0.091,
                                color: AppColors.black,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: screenWidth*0.03, vertical: screenHeight*0.01),
                              child: Text(
                                "Please ensure that the email id mentioned is valid  as we have sent an OTP to your email",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: screenWidth * 0.042,
                                  color: AppColors.gray,
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.03),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                  6,
                                  (index){
                                    return SizedBox(
                                      width: screenWidth*0.12,
                                      height: screenHeight*0.06,

                                      child: TextFormField(
                                        controller: _otpControllers[index],
                                        textAlign: TextAlign.center,
                                        maxLength: 1,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          counterText: "",
                                          contentPadding: EdgeInsets.zero,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            borderSide: BorderSide(color: AppColors.borders)
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            borderSide: BorderSide(color: AppColors.blue)
                                          )
                                        ),
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.06,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            ),

                            SizedBox(height: screenHeight*0.02,),

                            Text(
                              "+91 ${widget.phonenumber}?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 0.041,
                                color: AppColors.black,
                              ),
                            ),
                           SizedBox(height: screenHeight*0.3,),
                            RichText(
                                text: TextSpan(
                                  text: "Didn't receive OTP code?",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: screenWidth*0.041,
                                    color: AppColors.black
                                  ),
                                  children:[
                                    TextSpan(
                                      text: "Resend OTP",
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
                              height: screenHeight * 0.05,
                              child: ElevatedButton(
                                onPressed: () async{
                                  String otp = _otpControllers.map((e) => e.text).join();

                                  if (otp.length < 6) {
                                    Get.snackbar("Error", "Please enter a valid 6-digit OTP");
                                    return;
                                  }

                                   await _verifyController.verifyOtp(
                                    VerifyOtpRequestModel(email: widget.email, otp: otp),
                                  );



                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Callingscreen(name: widget.name,email: widget.email,)),
                                    );


                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  "Verify",
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
                  )
              )
            ],
          )
      );
  }
}
