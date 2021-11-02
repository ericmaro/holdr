import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
      inputDecorationTheme: InputDecorationTheme(filled: true),
      listTileTheme: ListTileThemeData(
        tileColor: Colors.white,
        iconColor: HexColor("#14183F"),
      ),
      primaryColor: HexColor("#14183F"),
      indicatorColor: HexColor("#14183F"),
      accentColor: HexColor("#14183F"),
      appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0),
      iconTheme: IconThemeData(color: Colors.grey),
      backgroundColor: HexColor("#FFFFFF"),
      // accentColor: Color.fromARGB(1, 0, 39, 72),
      scaffoldBackgroundColor: HexColor("#FFFFFF"),
      canvasColor: Colors.grey[200],
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: HexColor("#FFFFFF")),
      buttonTheme: ButtonThemeData(
        buttonColor: HexColor("#14183F"), //  <-- dark color
        textTheme:
            ButtonTextTheme.primary, //  <-- this auto selects the right color
      ));

  final darkTheme = ThemeData.dark().copyWith(
      inputDecorationTheme: InputDecorationTheme(filled: true),
      
      indicatorColor: HexColor("#14183F"),
      primaryColor: HexColor("#14183F"),
      accentColor: HexColor("#14183F"),
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
      ),
      listTileTheme: ListTileThemeData(
        tileColor: Colors.black,
        iconColor: Colors.white,
      ),
      backgroundColor: HexColor("#021623"),
      // accentColor: Color.fromARGB(1, 0, 39, 72),
      scaffoldBackgroundColor: HexColor("#021623"),
      canvasColor: HexColor("#021623"),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: HexColor("#14183F")),
      buttonTheme: ButtonThemeData(
        buttonColor: HexColor("#14183F"), //  <-- dark color
        textTheme:
            ButtonTextTheme.primary, //  <-- this auto selects the right color
      ));
}
