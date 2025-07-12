import 'package:csteachassignment/Screens/DashboardScreen.dart';
import 'package:csteachassignment/Screens/LanguageScreen.dart';
import 'package:csteachassignment/Utils/colors.dart';
import 'package:flutter/material.dart';

class Callingscreen extends StatefulWidget {
  final String name;
  final String email;
  const Callingscreen({super.key, required this.name, required this.email});

  @override
  State<Callingscreen> createState() => _CallingscreenState();
}

class _CallingscreenState extends State<Callingscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    final screenWidth= MediaQuery.of(context).size.width;
    final screenHeight= MediaQuery.of(context).size.height;
    return SafeArea(
        child: SingleChildScrollView(

          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth*0.05,
                vertical:  screenHeight*0.03
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: screenWidth,
                  height: screenHeight * 0.15,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: AppColors.borders,
                        width: 1.0
                      ),
                      borderRadius: BorderRadius.circular(18.0)
                    ),
                    color: AppColors.blue,
                    child: Padding(
                        padding: EdgeInsets.symmetric( horizontal: screenWidth*0.04),
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           ClipRRect(
                             borderRadius: BorderRadius.circular(40),
                             child: Image.asset(
                               "assets/images/colorcontact.png",
                               width: screenWidth * 0.15,
                               height: screenWidth * 0.15,
                               fit: BoxFit.cover,
                             ),
                           ),
                           SizedBox(width: screenWidth * 0.04),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hello ${widget.name}",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth * 0.045,
                            color: AppColors.white,
                          ),
                        ),
                        Text(
                          "Calley Personal",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth * 0.055,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    )
                      ],
                       ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight*0.01,),

                SizedBox(
                  width: screenWidth,
                  height: screenHeight*0.45,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: AppColors.borders,
                            width: 1.0
                        ),
                        borderRadius: BorderRadius.circular(18.0)

                  ),
                    color: AppColors.purple,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth*0.03,
                            vertical:  screenHeight*0.02
                          ),
                          child: Text(
                            "If you are here for the first time then ensure that you have uploaded the list to call from Calley Web Panel hosted on: https://app.getcalley.com",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: screenWidth * 0.038,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
                            ),
                          ),
                        ),

                        Expanded(
                          child: Image.asset(
                            "assets/images/youtube.png",
                            width: double.infinity,

                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),

                )
                ),
                SizedBox(height: screenHeight*0.17,),

                Row(
                  children: [

                    SizedBox(
                      width: screenWidth*0.2,
                      height: screenHeight*0.09,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: AppColors.greenborders,
                            width: 1.0
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        color: AppColors.white,
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.015),
                          child: Image.asset("assets/images/whatsapp.png"),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth*0.01,),
                    Expanded(

                      child: SizedBox(

                        height: screenHeight * 0.05,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=> Dashboardscreen(name: widget.name, email: widget.email,))
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Star Calling Now",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: screenWidth * 0.04,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }

}
