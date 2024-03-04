import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/view/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {

    super.initState();
  Timer(const Duration(seconds: 4), () {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const HomeScreen() ,));
   });}

  @override
  Widget build(BuildContext context) {
    // final height=MediaQuery.sizeOf(context).height *1;
    // final width=MediaQuery.sizeOf(context).width *1;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[ Image.asset('images/splash_pic.jpg',
        fit: BoxFit.cover,
        height: 380,
        width: 540,
        ),
      const SizedBox(height: 15,),
        Text('TOP HEADLINES',
        style: GoogleFonts.antic(letterSpacing: .6,
        color:Colors.grey.shade700),),
       const SizedBox(height: 15,),
       const SpinKitChasingDots(
          color: Colors.blue,
          size: 40,
        )
        ]
      ),
    );
  }
}