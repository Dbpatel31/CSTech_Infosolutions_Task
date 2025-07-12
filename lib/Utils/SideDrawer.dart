import 'package:csteachassignment/Utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget{
  final String name;
  final String email;
  const SideDrawer({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(40)),
      ),
      child:SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: AppColors.blue),
                  child: Row(
                    children: [
                      Image.asset("assets/images/colorcontact.png"),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Text("${name} . Personal", style: TextStyle(color: AppColors.white, fontSize: screenWidth*0.06, fontWeight: FontWeight.w600, fontFamily: 'Inter')),
                          Text("${email}", style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: screenWidth*0.03, fontFamily: 'Inter')),
                        ],
                      ),
                    ],
                  )

              ),

              ..._buildMenuItem("Getting Started", "assets/images/rocket.png"),
              ..._buildMenuItem("Sync Data", "assets/images/recover.png"),
              ..._buildMenuItem("Gamification", "assets/images/apps.png"),
              ..._buildMenuItem("Send Logs", "assets/images/callwithmessage.png"),
              ..._buildMenuItem("Settings", "assets/images/settings.png"),
              ..._buildMenuItem("Help?", "assets/images/help.png"),
              ..._buildMenuItem("Cancle Subscription", "assets/images/canclesubscription.png"),


              const Divider(),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("App Info", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              ..._buildMenuItem("About Us", "assets/images/aboutus.png"),
              ..._buildMenuItem("Privacy Policy", "assets/images/privacypolicy.png"),
              ..._buildMenuItem("Version 1.0.1.52", "assets/images/versions.png"),
              ..._buildMenuItem("Share App", "assets/images/share.png"),
              ..._buildMenuItem("Logout", "assets/images/logout.png"),

            ],
          )
      ),
    );
  }
  List<Widget> _buildMenuItem(String title, String imagePath) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: AppColors.borders),
          ),
          child: ListTile(
            leading: Image.asset(imagePath, height: 24, width: 24),
            title: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            onTap: () {
              // Handle navigation
            },
          ),
        ),
      ),
    ];
  }
}