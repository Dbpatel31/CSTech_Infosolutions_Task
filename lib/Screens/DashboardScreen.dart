// import 'package:csteachassignment/Utils/colors.dart';
// import 'package:flutter/material.dart';
//
// class Dashboardscreen extends StatefulWidget {
//   const Dashboardscreen({super.key});
//
//   @override
//   State<Dashboardscreen> createState() => _DashboardscreenState();
// }
//
// class _DashboardscreenState extends State<Dashboardscreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: AppColors.appbackground,
//       appBar: _buildAppBar(),
//       body: _buildBody(),
//     );
//   }
//
//   PreferredSizeWidget _buildAppBar(){
//     return AppBar(
//       backgroundColor: AppColors.white,
//       foregroundColor: AppColors.black,
//       leading: Padding(
//         padding: const EdgeInsets.only(left: 8.0),
//         child: Image.asset("assets/images/threeverticalline.png", height: 24),
//       ),
//       title: Text(
//           "Dashboard",
//         style: TextStyle(
//           fontFamily: 'Inter',
//           fontWeight: FontWeight.w500,
//           color: AppColors.black,
//         ),
//       ),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: Image.asset("assets/images/headphone.png", height: 24),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: Image.asset("assets/images/notification.png", height: 24),
//         ),
//       ],
//
//     );
//   }
//
//   Widget _buildBody(){
//     final screenWidth= MediaQuery.of(context).size.width;
//     final screenHeight= MediaQuery.of(context).size.height;
//     return SafeArea(
//         child: Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: screenWidth*0.05,
//               vertical: screenHeight*0.03
//             ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(
//                 width: screenWidth,
//                 height: screenHeight * 0.15,
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                       side: BorderSide(
//                           color: AppColors.borders,
//                           width: 1.0
//                       ),
//                       borderRadius: BorderRadius.circular(18.0)
//                   ),
//                   color: AppColors.blue,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric( horizontal: screenWidth*0.04),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(40),
//                           child: Image.asset(
//                             "assets/images/colorcontact.png",
//                             width: screenWidth * 0.15,
//                             height: screenWidth * 0.15,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         SizedBox(width: screenWidth * 0.04),
//
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Hello Swati",
//                               style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: screenWidth * 0.045,
//                                 color: AppColors.white,
//                               ),
//                             ),
//                             Text(
//                               "Calley Personal",
//                               style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: screenWidth * 0.055,
//                                 color: AppColors.white,
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: screenHeight*0.02,),
//               SizedBox(
//                   width: screenWidth,
//                   height: screenHeight*0.47,
//                   child: Card(
//                     shape: RoundedRectangleBorder(
//                         side: BorderSide(
//                             color: AppColors.borders,
//                             width: 1.0
//                         ),
//                         borderRadius: BorderRadius.circular(18.0)
//                     ),
//                     color: AppColors.purple,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: screenWidth*0.03,
//                               vertical:  screenHeight*0.02
//                           ),
//                           child: Align(
//                             alignment: Alignment.center,
//                             child: Text(
//                               "LOAD NUMBER TO CALL",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 fontSize: screenWidth * 0.041,
//                                 fontWeight: FontWeight.w700,
//                                 color: AppColors.white,
//                               ),
//                             ),
//                           ),
//
//                         ),
//
//                         SizedBox(
//                           width: screenWidth,
//                           child: Card(
//                             shape: RoundedRectangleBorder(
//                               side: BorderSide(color: AppColors.borders, width: 1.0),
//                               borderRadius: BorderRadius.circular(18.0),
//                             ),
//                             color: AppColors.white,
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: screenWidth * 0.04,
//                                     vertical: screenHeight * 0.015,
//                                   ),
//                                   child: Text(
//                                     "Visit https://app.getcalley.com to uploade numbers that you wish to call using Calley Mobile App",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       fontFamily: 'Inter',
//                                       fontSize: screenWidth * 0.041,
//                                       fontWeight: FontWeight.w500,
//                                       color: AppColors.black,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: screenHeight * 0.25,
//                                   width: double.infinity,
//                                   child: Image.asset(
//                                     "assets/images/personwithcalling.png",
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//
//                   )
//               ),
//             ],
//           ),
//         )
//     );
//   }
// }

import 'package:csteachassignment/Screens/TestListScreen.dart';
import 'package:csteachassignment/Utils/colors.dart';
import 'package:flutter/material.dart';

class Dashboardscreen extends StatefulWidget {
  final String name;
  final String email;
  const Dashboardscreen({super.key, required this.name, required this.email});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 2) {
      _showPlayBottomSheet(); // Show modal
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.appbackground,
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.bottombackground,
            border: Border(
              top: BorderSide(
                color: AppColors.borders, // Set your border color here
                width: 1.0,
              ),
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: AppColors.blue,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/home.png',
                  height: 24,

                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/personinfo.png',
                  height: 24,

                ),
                label: 'Personinfo',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 50, // Set your desired width here
                  child: Card(
                    color: AppColors.blue, // Or Colors.blue
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Image.asset(
                        'assets/images/play.png',
                        height: 24,
                        width: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                label: 'Play',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/callincoming.png',
                  height: 24,
                ),
                label: 'CallIncoming',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/calender.png',
                  height: 24,

                ),
                label: 'Calender',
              ),
            ],
          ),
        ),
      ),
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

  Widget _buildBody() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.03,
          ),
          child: Column(
            children: [
              // Top Blue Card
              SizedBox(
                width: screenWidth,
                height: screenHeight * 0.15,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.borders, width: 1.0),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: AppColors.blue,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
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

              SizedBox(height: screenHeight * 0.02),

              // Purple Card
              SizedBox(
                width: screenWidth,
                height: screenHeight * 0.47,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.borders, width: 1.0),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: AppColors.purple,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth*0.03,
                        vertical: screenHeight*0.01),
                        child: Text(
                          "LOAD NUMBER TO CALL",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: screenWidth * 0.041,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      // Inner White Card
                      Expanded(
                        child: Card(
                          margin: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: AppColors.borders, width: 1.0),
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          color: AppColors.white,
                          clipBehavior: Clip.antiAlias, // Important for image clipping
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.04),
                                child: Text(
                                  "Visit https://app.getcalley.com to upload numbers that you wish to call using Calley Mobile App",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: screenWidth * 0.041,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),

                              // Image perfectly connected to bottom and fills width
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(18.0),
                                  ),
                                  child: Image.asset(
                                    "assets/images/personwithcalling.png",
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(height: screenHeight*0.015,),
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
                  SizedBox(width: screenWidth*0.03,),
                  Expanded(

                    child: SizedBox(

                      height: screenHeight * 0.07,
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
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _showPlayBottomSheet() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      builder: (context) {
        return SizedBox(
            width: screenWidth,
            height: screenHeight * 0.47,
            child: Card(
              margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.borders, width: 1.0),
        borderRadius: BorderRadius.circular(18.0),
        ),
        color: AppColors.purple,
        child: Column(
        children: [
        Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth*0.03,
        vertical: screenHeight*0.01),
        child: Text(
        "CALLING LISTS",
        textAlign: TextAlign.center,
        style: TextStyle(
        fontFamily: 'Inter',
        fontSize: screenWidth * 0.041,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
        ),
        ),
        ),
          Expanded(
            child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColors.borders, width: 1.0),
                borderRadius: BorderRadius.circular(18.0),
              ),
              color: AppColors.white,
              clipBehavior: Clip.antiAlias, // Important for image clipping
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.015,
                    ),
                    child: _buildCallingCard(
                      title: "Select Calling List",
                      trailing: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blue,
                          foregroundColor: AppColors.white,
                        ),
                        child: Row(
                          children: [
                            Image.asset("assets/images/referesh.png", height: 18, width: 18),
                            SizedBox(width: screenWidth * 0.02),
                            Text(
                              "Refresh",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      screenWidth: screenWidth,
                      bgColor: AppColors.bottombackground,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.015,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Testlistscreen(name: widget.name, email: widget.email,)), // Replace with your actual screen
                        );
                      },
                      child: _buildCallingCard(
                        title: "Test Lists",
                        trailing: Image.asset("assets/images/logout.png", height: 24, width: 24),
                        screenWidth: screenWidth,
                        bgColor: AppColors.bottombackground,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),

        ],
        ),
        ),
        );
      },
    );
  }

  Widget _buildCallingCard({
    required String title,
    required Widget trailing,
    required double screenWidth,
    required Color bgColor,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.borders, width: 1.0),
        borderRadius: BorderRadius.circular(18.0),
      ),
      color: bgColor,
      child: SizedBox(
        height: 60, // <-- fixed height for both cards
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: screenWidth * 0.041,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              trailing,
            ],
          ),
        ),
      ),
    );
  }
}
