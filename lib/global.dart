import 'package:flutter/material.dart';

class Global {
  static ThemeData getThemeData() {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.deepOrange,

      primaryColor: const Color(0xff403F4C),

      // Default background
      accentColor: const Color(0xff79ADDC),

      fontFamily: 'Montserrat',

      textTheme: TextTheme(
        headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
        title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic, color: const Color(0xff040403)),
        body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: const Color(0xff040403)),
      ),
    );
  }
}
