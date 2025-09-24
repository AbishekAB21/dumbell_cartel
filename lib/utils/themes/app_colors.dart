import 'package:flutter/material.dart';

/// Contains all the colors used across the app

Appcolor appcolor = AppDefaultColor();

abstract class Appcolor {
  final Color primaryColor;
  final Color secondaryGradient1;
  final Color secondaryGradient2;
  final Color textColor;
  final Color background;
  final Color darkOverlay;
  final Color textfieldBackground;
  final Color textfieldBackground2;
  final Color hintTextColor;
  final Color successColor;
  final Color errorColor;
  final Color deleteColor;
  final Color warningColor;
  final Color teritiaryColor;
  final Color iconColor;
  final Color transparent;

  Appcolor({
    required this.primaryColor,
    required this.secondaryGradient1,
    required this.secondaryGradient2,
    required this.textColor,
    required this.background,
    required this.darkOverlay,
    required this.textfieldBackground,
    required this.textfieldBackground2,
    required this.hintTextColor,
    required this.successColor,
    required this.errorColor,
    required this.deleteColor,
    required this.warningColor,
    required this.teritiaryColor,
    required this.iconColor,
    required this.transparent,
  });
}

class AppDefaultColor extends Appcolor {
  AppDefaultColor()
    : super(
        primaryColor: Colors.black,
        secondaryGradient1: Color.fromRGBO(165, 235, 63, 1),
        secondaryGradient2: Color.fromRGBO(144, 204, 54, 1),
        teritiaryColor: Color.fromRGBO(163, 239, 50, 1),
        textColor: Colors.white70,
        background: Colors.black,
        darkOverlay: Colors.black,
        textfieldBackground: Colors.grey.shade900,
        textfieldBackground2: Colors.grey.shade600,
        hintTextColor: Colors.white24,
        successColor: Colors.green.shade900,
        errorColor: Colors.red,
        deleteColor: const Color.fromARGB(255, 152, 23, 14),
        warningColor: Colors.amber,
        iconColor: Colors.white,
        transparent: Colors.transparent
      );
}

class AppDarkColor extends Appcolor {
  AppDarkColor()
    : super(
        primaryColor: Colors.black,
        secondaryGradient1: Color.fromRGBO(165, 235, 63, 1),
        secondaryGradient2: Color.fromRGBO(144, 204, 54, 1),
        teritiaryColor: Color.fromRGBO(163, 239, 50, 1),
        textColor: Colors.white70,
        background: Colors.black,
        darkOverlay: Colors.black,
        textfieldBackground: Colors.grey.shade900,
        textfieldBackground2: Colors.grey.shade800,
        hintTextColor: Colors.white,
        successColor: Colors.green.shade900,
        errorColor: Colors.red,
        deleteColor: const Color.fromARGB(255, 152, 23, 14),
        warningColor: Colors.amber,
        iconColor: Colors.white,
        transparent: Colors.transparent
      );
}

class AppLightColor extends Appcolor {
  AppLightColor()
    : super(
        primaryColor: Colors.white,
        secondaryGradient1: Color.fromRGBO(165, 235, 63, 1),
        secondaryGradient2: Color.fromRGBO(144, 204, 54, 1),
        teritiaryColor: Color.fromRGBO(163, 239, 50, 1),
        textColor: Colors.black87,
        background: Colors.white,
        darkOverlay: Colors.black,
        textfieldBackground: Colors.grey.shade300,
        textfieldBackground2: Colors.grey.shade100,
        hintTextColor: Colors.black26,
        successColor: Colors.green,
        errorColor: Colors.red,
        deleteColor: const Color.fromARGB(255, 152, 23, 14),
        warningColor: Colors.amber,
        iconColor: Colors.black,
        transparent: Colors.transparent
      );
}
