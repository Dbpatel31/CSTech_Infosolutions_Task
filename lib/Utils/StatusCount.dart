import 'package:csteachassignment/Utils/colors.dart';
import 'package:flutter/material.dart';

class StatusCount extends StatelessWidget {
  final String title;
  final int count;
  final Color color;
  final Color cardcolor;

  const StatusCount(
      {required this.title, required this.count, required this.color,required this.cardcolor});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return  SizedBox(
        width: screenWidth * 0.28,
        height: screenHeight * 0.1,
        child: Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
    side: BorderSide(
    color: AppColors.borders,
    width: 1.0,
    ),
    ),
    color: cardcolor,
    child: Center( // Center content vertically and horizontally
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    "$count",
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: color,
    ),
    ),
    const SizedBox(height: 4),
    Text(
    title,
    style: const TextStyle(fontSize: 14),
    ),
    ],
    ),
    ),
    ),
    );
  }
}