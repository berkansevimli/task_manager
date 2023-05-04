import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'core/utilities/color_utils.dart';

ThemeData lightTheme() {
  return ThemeData(
    colorScheme: ColorScheme.light(),
    fontFamily: "Muli",
    appBarTheme: appBarTheme(1),

    primaryColor: ColorUtilities.purple_button,
    primaryColorLight: ColorUtilities.text_300,

    ///Text color 2
    primaryColorDark: ColorUtilities.primary_700,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,

    ///terms conditions
    cardColor: ColorUtilities.text_500, //textfield text color
    highlightColor: ColorUtilities.light_100, //
    canvasColor: ColorUtilities.text_100,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme(int data) {
  return AppBarTheme(
      color: ColorUtilities.primary_500,
      elevation: 1,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: data == 1 ? Brightness.light : Brightness.dark),
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: ColorUtilities.white, fontSize: 18));
}
