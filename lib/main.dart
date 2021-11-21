import 'package:day_1/pages/login_page.dart';
import 'package:day_1/utils/routes.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  doSomething({@required bool y = false, int x = 100}) {}
  @override
  Widget build(BuildContext context) {
    doSomething();
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: GoogleFonts.lato().fontFamily,
          primaryTextTheme: GoogleFonts.latoTextTheme()),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      initialRoute: "/login",
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
