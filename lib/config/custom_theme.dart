import 'package:flutter/material.dart';

class CustomTheme {
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color semiGray = Color.fromRGBO(241, 242, 241, 1);
  static const Color grey = Colors.grey;
  static const Color darkGray = Color.fromRGBO(114, 114, 119, 1);
  static const Color darkestGrey = Color.fromRGBO(34, 34, 34, 1);
  static const Color black = Color.fromRGBO(10, 13, 24, 1);
  static const Color red = Color.fromARGB(255, 253, 90, 90);
  static const Color yellow = Color.fromRGBO(250, 206, 45, 1);

  static const buttonHeight = 50.0;
  static const spacing = 16.0;
  static const inputRadius = BorderRadius.all(Radius.circular(8.0));
  static const contentPadding = EdgeInsets.all(spacing);

  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: grey,
      secondary: darkestGrey,
    ),
    scaffoldBackgroundColor: semiGray,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: black),
      foregroundColor: black,
      elevation: .0,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: contentPadding,
      filled: true,
      fillColor: white,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: semiGray),
        borderRadius: inputRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: semiGray),
        borderRadius: inputRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: darkGray),
        borderRadius: inputRadius,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: semiGray),
        borderRadius: inputRadius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: red),
        borderRadius: inputRadius,
      ),
      errorStyle: TextStyle(
        color: red,
      ),
      errorMaxLines: 2,
      labelStyle: TextStyle(
        color: grey,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
      hintStyle: TextStyle(color: darkGray),
    ),
    iconTheme: const IconThemeData(
      color: darkGray,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: darkGray,
    ),
  );

  static LinearGradient pageGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      darkGray,
      darkGray,
    ],
  );

  static TextStyle appBarTitle = const TextStyle(letterSpacing: 20.0);
}
