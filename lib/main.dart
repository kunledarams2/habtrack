import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habtrack/ui/onboardingScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapShot) {
        if (snapShot.hasError) {
          return somethingWentWrong();
        }
        if (snapShot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
//      theme: ThemeData(fontFamily: "AveriaSerifLibre"),
            theme: ThemeData(
                inputDecorationTheme: InputDecorationTheme(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70))),
                fontFamily: "AvertaStd"),

            home: OnBoardScreen(),
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
//      theme: ThemeData(fontFamily: "AveriaSerifLibre"),
          theme: ThemeData(
              inputDecorationTheme: InputDecorationTheme(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70))),
              fontFamily: "AvertaStd"),

          home: OnBoardScreen(),
        );
      },
    );
  }

  Widget somethingWentWrong() {
    return Container(
      child: Text("data"),
    );
  }

/* Widget loading() {
    return Container(
      child: Text("data"),
    );
  }*/
}

/*
class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return somethingWentWrong();
    }
    if (!_initialized) {
      return loading();
    }
    return appBody();
  }

  Widget somethingWentWrong() {}

  Widget loading() {}

  Widget appBody() {
    return Container();
   */
/* MaterialApp(
      debugShowCheckedModeBanner: false,
//      theme: ThemeData(fontFamily: "AveriaSerifLibre"),
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70))),
          fontFamily: "AvertaStd"),

      home: OnBoardScreen(),
    );*/ /*

  }
}
*/
