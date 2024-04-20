// ignore_for_file: prefer_const_constructors

import 'package:bagsapp/screens/home_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
         fontFamily: 'FiraSans',
    
      useMaterial3: true,
      ),
      home:  homeScreen(),
    );
  }
}
