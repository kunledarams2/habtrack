import 'package:flutter/material.dart';
import 'package:habtrack/ui/onboardingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
//      theme: ThemeData(fontFamily: "AveriaSerifLibre"),
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70))),fontFamily: "AvertaStd"),

      home: OnBoardScreen(),
    );
  }
}
