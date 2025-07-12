import 'package:csteachassignment/Screens/LanguageScreen.dart';
import 'package:csteachassignment/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.appbackground,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Languagescreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: AppColors.appbackground,
//      appBar: AppBar(
//        backgroundColor: Colors.black,
//        foregroundColor: Colors.white,
//        title: Text("CSTech Task"),
//        centerTitle: true,
//      ),
//      body: Center(
//        child: ElevatedButton(
//            onPressed: (){
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context)=> Languagescreen())
//              );
//            },
//            child: Text("Go To Language Screen")
//        ),
//      ),
//    );
//   }
// }
