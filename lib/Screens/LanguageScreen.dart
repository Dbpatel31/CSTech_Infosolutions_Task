import 'package:csteachassignment/Screens/RegisterScreen.dart';
import 'package:csteachassignment/Utils/colors.dart';
import 'package:flutter/material.dart';

class Languagescreen extends StatefulWidget {
  const Languagescreen({super.key});

  @override
  State<Languagescreen> createState() => _LanguagescreenState();
}

class _LanguagescreenState extends State<Languagescreen> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appbackground,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    var Languages= ['English', 'Hindi', 'Bengali', 'Kannada', 'Punjabi', 'Tamil', 'Telugu', 'French','Spanish'];
    var selcted= ["Hi", "नमस्ते", "হ্যালো", "ನಮಸ್ಕಾರ","ਨਮਸਤੇ", "வணக்கம்", "హై/నమస్తే", "Bonjure", "Hola"];

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.03),
            Text(
              "Choose Your Language",
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: screenWidth * 0.045,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: AppColors.borders,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: AppColors.white,
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenHeight * 0.015,
                  ),
                  child: ListView.builder(
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          '${Languages[index]}',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontFamily: 'Inter',
                            color: AppColors.black,
                          ),
                        ),
                        subtitle: Text(
                          '${selcted[index]}',
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            fontFamily: 'Inter',
                            color: AppColors.gray,
                          ),
                        ),
                        trailing: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: AppColors.black,
                              width: 1.0
                            ),
                            borderRadius: BorderRadius.circular(12.0)
                          ),
                          color: AppColors.white,
                          child: CircleAvatar(
                            radius: screenWidth * 0.04,
                            backgroundColor: _selectedIndex == index
                                ? AppColors.black
                                : AppColors.white,

                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            SizedBox(
              width: double.infinity,
              height: screenHeight * 0.06,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                    MaterialPageRoute(builder: (context)=>Registerscreen())
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Select",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: screenWidth * 0.04,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
}
}