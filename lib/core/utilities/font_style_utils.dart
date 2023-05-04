import 'package:flutter/material.dart';

import '../../size_config.dart';

/// THIS ENUM IS USED TO MANAGE FONT_WEIGHT...
enum FWT {
  light,
  regular,
  medium,
  semiBold,
  bold,
}

/// THIS CLASS IS USED TO MANAGE FONT_STYLES USED IN THE APPLICATION...
class FontStyleUtilities {
  /// THIS FUINCTION RETURNS FONT_WEIGHT ACCORDING TO USER REQUIREMENT(FROM ENUM)...
  static FontWeight getFontWeight({FWT fontWeight = FWT.regular}) {
    switch (fontWeight) {
      case FWT.bold:
        return FontWeight.w700;
        break;
      case FWT.semiBold:
        return FontWeight.w600;
        break;
      case FWT.medium:
        return FontWeight.w500;
        break;
      case FWT.regular:
        return FontWeight.w400;
        break;
      case FWT.light:
        return FontWeight.w300;
        break;
      default:
        return FontWeight.w400;
        break;
    }
  }

  /// FONTSTYLE FOR FONT SIZE 34
  static TextStyle h1({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
        color: fontColor,
        fontWeight: getFontWeight(fontWeight: fontWeight ?? FWT.regular),
        fontSize: getProportionateScreenWidth(34),
        fontFamily: "OpenSans");
  }

  /// FONTSTYLE FOR FONT SIZE 30
  static TextStyle h2({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
        color: fontColor,
        fontWeight: getFontWeight(fontWeight: fontWeight ?? FWT.regular),
        fontSize: getProportionateScreenWidth(30),
        fontFamily: "OpenSans");
  }

  /// FONTSTYLE FOR FONT SIZE 24
  static TextStyle h3({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
        color: fontColor,
        fontWeight: getFontWeight(fontWeight: fontWeight ?? FWT.regular),
        fontSize: getProportionateScreenWidth(24),
        fontFamily: "OpenSans");
  }

  /// FONTSTYLE FOR FONT SIZE 22
  static TextStyle h7({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
        color: fontColor,
        fontWeight: getFontWeight(fontWeight: fontWeight ?? FWT.regular),
        fontSize: getProportionateScreenWidth(22),
        fontFamily: "OpenSans");
  }

  /// FONTSTYLE FOR FONT SIZE 20
  static TextStyle h4({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
        color: fontColor,
        fontWeight: getFontWeight(fontWeight: fontWeight ?? FWT.regular),
        fontSize: getProportionateScreenWidth(20),
        fontFamily: "OpenSans");
  }

  /// FONTSTYLE FOR FONT SIZE 17
  static TextStyle h5({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
        color: fontColor,
        fontWeight: getFontWeight(fontWeight: fontWeight ?? FWT.regular),
        fontSize: getProportionateScreenWidth(17),
        fontFamily: "OpenSans");
  }

  /// FONTSTYLE FOR FONT SIZE 18
  static TextStyle h44({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
        color: fontColor,
        fontWeight: getFontWeight(fontWeight: fontWeight ?? FWT.regular),
        fontSize: getProportionateScreenWidth(18),
        fontFamily: "OpenSans");
  }

  /// FONTSTYLE FOR FONT SIZE 16
  static TextStyle h6({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
        color: fontColor,
        fontWeight: getFontWeight(fontWeight: fontWeight ?? FWT.regular),
        fontSize: getProportionateScreenWidth(16),
        fontFamily: "OpenSans");
  }

  /// FONTSTYLE FOR FONT SIZE 15
  static TextStyle t1({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
        color: fontColor,
        fontWeight: getFontWeight(fontWeight: fontWeight ?? FWT.regular),
        fontSize: getProportionateScreenWidth(15),
        fontFamily: "OpenSans");
  }

  /// FONTSTYLE FOR FONT SIZE 14
  static TextStyle t2({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
        color: fontColor,
        fontWeight: getFontWeight(fontWeight: fontWeight ?? FWT.regular),
        fontSize: getProportionateScreenWidth(14),
        fontFamily: "OpenSans");
  }

  /// FONTSTYLE FOR FONT SIZE 13
  static TextStyle t33({
    //for underlined text
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
        color: fontColor,
        fontWeight: getFontWeight(fontWeight: fontWeight ?? FWT.regular),
        fontSize: getProportionateScreenWidth(13),
        fontFamily: "OpenSans",
        decoration: TextDecoration.underline);
  }

  /// FONTSTYLE FOR FONT SIZE 13
  static TextStyle t3({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
        color: fontColor,
        fontWeight: getFontWeight(fontWeight: fontWeight ?? FWT.regular),
        fontSize: getProportionateScreenWidth(13),
        fontFamily: "OpenSans");
  }

  /// FONTSTYLE FOR FONT SIZE 12
  static TextStyle t4({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
        color: fontColor,
        fontWeight: getFontWeight(fontWeight: fontWeight ?? FWT.regular),
        fontSize: getProportionateScreenWidth(12),
        fontFamily: "OpenSans");
  }

  /// FONTSTYLE FOR FONT SIZE 11
  static TextStyle t5({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
        color: fontColor,
        fontWeight: getFontWeight(fontWeight: fontWeight ?? FWT.regular),
        fontSize: getProportionateScreenWidth(11),
        fontFamily: "OpenSans");
  }

  /// FONTSTYLE FOR FONT SIZE 14
  static TextStyle l1({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
        color: fontColor,
        fontWeight: getFontWeight(fontWeight: fontWeight ?? FWT.regular),
        fontSize: getProportionateScreenWidth(14),
        fontFamily: "OpenSans");
  }

  /// FONTSTYLE FOR FONT SIZE 14
  static TextStyle p1({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
        color: fontColor,
        fontWeight: getFontWeight(fontWeight: fontWeight ?? FWT.regular),
        fontSize: getProportionateScreenWidth(14),
        fontFamily: "OpenSans");
  }

  /// FONTSTYLE FOR FONT SIZE 13
  static TextStyle p2({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
        color: fontColor,
        fontWeight: getFontWeight(fontWeight: fontWeight ?? FWT.regular),
        fontSize: getProportionateScreenWidth(13),
        fontFamily: "OpenSans");
  }

  /// FONTSTYLE FOR FONT SIZE 12
  static TextStyle p3({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
        color: fontColor,
        fontWeight: getFontWeight(fontWeight: fontWeight ?? FWT.regular),
        fontSize: getProportionateScreenWidth(12),
        fontFamily: "OpenSans");
  }
}
