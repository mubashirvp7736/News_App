import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text('News',
        style: GoogleFonts.antic(letterSpacing: .6,
        color:Colors.grey.shade700),),
      ),
    );
  }
}