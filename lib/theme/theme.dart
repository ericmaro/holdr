import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
      inputDecorationTheme: InputDecorationTheme(filled: true),
      primaryColor: HexColor("#14183F"),
      indicatorColor: HexColor("#14183F"),
      appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.white,
          elevation: 0),
      iconTheme: IconThemeData(color: Colors.grey),
      backgroundColor: HexColor("#FFFFFF"),
      // accentColor: Color.fromARGB(1, 0, 39, 72),
      colorScheme: ColorScheme(
          primary: HexColor("#14183F"),
          background: HexColor("#021623"),
          brightness: Brightness.light,
          surface: HexColor("#021623"),
          error: Colors.red,
          onBackground: HexColor("#021623"),
          onError: Colors.red,
          onPrimary: HexColor("#14183F"),
          onSecondary: HexColor("#14183F"),
          onSurface: HexColor("#14183F"),
          primaryVariant: HexColor("#14183F"),
          secondaryVariant: HexColor("#14183F"),
          secondary: HexColor("#14183F")),
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
      colorScheme: ColorScheme(
          primary: HexColor("#14183F"),
          background: HexColor("#021623"),
          brightness: Brightness.light,
          surface: HexColor("#021623"),
          error: Colors.red,
          onBackground: HexColor("#021623"),
          onError: Colors.red,
          onPrimary: HexColor("#14183F"),
          onSecondary: HexColor("#14183F"),
          onSurface: HexColor("#14183F"),
          primaryVariant: HexColor("#FFFFFF"),
          secondaryVariant: HexColor("#14183F"),
          secondary: HexColor("#14183F")),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
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
