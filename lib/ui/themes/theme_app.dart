import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeApp {
  ThemeApp._();

  static final lightTheme = ThemeData(
    //*SCAFFOLD

    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      unselectedLabelStyle: TextStyle(color: Colors.grey.shade700),
      elevation: 0,
    ),
    appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.epilogue(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0),

    //*estilos
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(
          Colors.white,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 50),
        ),
      ),
    ),
    // appBarTheme:
    //     AppBarTheme(titleTextStyle: GoogleFonts.inter(color: Colors.red)),
    textTheme: TextTheme(
      bodyText2: GoogleFonts.inter(color: Colors.black),
      bodyText1:
          GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );

  static final darkTheme = ThemeData(
      //*SCAFFOLD
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.epilogue(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        unselectedItemColor: Colors.white,
        elevation: 0,
      ),

      //*estilos
      textTheme: TextTheme(
        bodyText2: const TextStyle(color: Colors.white),
        bodyText1:
            GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      listTileTheme: const ListTileThemeData(textColor: Colors.white),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
            Colors.white,
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 50),
          ),
        ),
      ));
}
