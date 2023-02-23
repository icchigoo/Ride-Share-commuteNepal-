// ignore_for_file: prefer_const_constructors

import 'package:commute_nepal/registration/screen/EnterPhone_Screen.dart';
import 'package:commute_nepal/registration/screen/Signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/enter_phone',
      routes: {
        '/': (context) => Signup_Screen(),
        // enter phone screen
        '/enter_phone': (context) => EnterPhoneScreen(),
      },
    );
  }
}