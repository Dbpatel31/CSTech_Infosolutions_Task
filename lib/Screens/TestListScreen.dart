import 'package:csteachassignment/Utils/SideDrawer.dart';
import 'package:flutter/material.dart';

import '../Utils/StatusCount.dart';
import '../Utils/colors.dart';
import 'CallingScreen.dart';

class Testlistscreen extends StatefulWidget {
  final String name;
  final String email;
  const Testlistscreen({super.key, required this.name, required this.email});

  @override
  State<Testlistscreen> createState() => _TestlistscreenState();
}

class _TestlistscreenState extends State<Testlistscreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer:  SideDrawer(name:widget.name, email: widget.email,),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Image.asset("assets/images/threeverticalline.png", height: 24),
      ),
      title: Text(
        "Dashboard",
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Image.asset("assets/images/headphone.png", height: 24),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Image.asset("assets/images/notification.png", height: 24),
        ),
      ],
    );
  }

  Widget _buildBody(){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding
      (
        padding: EdgeInsets.all(screenWidth*0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: BorderSide(
                  color: AppColors.borders,
                  width: 1.0
                )
              ),
              color: AppColors.white,
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Test List", style: TextStyle(fontSize: screenWidth*0.05, fontWeight: FontWeight.w600, fontFamily: 'Inter',color: AppColors.black)),
                        SizedBox(height: 4),
                        RichText(
                            text: TextSpan(
                              text: "50",
                              style: TextStyle(
                                color: AppColors.blue,
                                fontFamily: 'Inter',
                                fontSize: screenWidth*0.09,
                                fontWeight: FontWeight.w700,
                              ),
                              children: [
                               TextSpan(
                                text:  "CALLS",
                                   style: TextStyle(
                                     color: AppColors.black,
                                     fontFamily: 'Inter',
                                     fontSize: screenWidth*0.03,
                                     fontWeight: FontWeight.w400,
                                   )
                               )
                              ]
                            )
                        ),

                      ],
                    ),
                    SizedBox(
                      width: screenWidth*0.2,
                      height: screenHeight*0.09,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: AppColors.borders,
                              width: 1.0
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        color: AppColors.blue,
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.015),
                          child:Align( alignment: Alignment.center ,child: Text("S", style: TextStyle(fontSize: screenWidth*0.09, fontWeight: FontWeight.w700, fontFamily: 'Inter',color: AppColors.white))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            Center( child: Image.asset("assets/images/chart.png")),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                StatusCount(title: "Pending", count: 28, color: Colors.orange, cardcolor: AppColors.lightorange,),
                StatusCount(title: "Done", count: 22, color: Colors.green, cardcolor: AppColors.lightgreen,),
                StatusCount(title: "Schedule", count: 9, color: Colors.purple, cardcolor: AppColors.lightpurple,),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: screenHeight * 0.06,
              child: ElevatedButton(
                onPressed: (){
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Callingscreen()),
                  // );
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
          ],
        ),
    );
  }
}
