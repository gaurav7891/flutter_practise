import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      backgroundColor: creamColor,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      buttonColor: darkBluishColor,
      accentColor: darkBluishColor,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      primaryTextTheme: GoogleFonts.latoTextTheme());

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      backgroundColor: darkBluishColor,
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      buttonColor: lightBluishColor,
      accentColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      primaryTextTheme: GoogleFonts.latoTextTheme());

// Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo700;
}
