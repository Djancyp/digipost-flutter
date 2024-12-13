import 'package:digipost/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './app_defaults.dart';

class AppTheme {
  static ThemeData get defaultTheme {
    return ThemeData(
      colorSchemeSeed: TailwindColors.gray500,
      fontFamily: "Gilroy",
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: TailwindColors.gray200),
        bodyMedium: TextStyle(color: TailwindColors.gray200),
        titleSmall: TextStyle(
            color: TailwindColors.gray200,
            fontSize: 14,
            fontWeight: FontWeight.normal),
      ),
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        elevation: 0.3,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: "Gilroy",
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(AppDefaults.padding),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: AppDefaults.borderRadius,
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(AppDefaults.padding),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: AppDefaults.borderRadius,
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Gilroy',
          ),
        ),
      ),
      inputDecorationTheme: defaultInputDecorationTheme,
      sliderTheme: const SliderThemeData(
        showValueIndicator: ShowValueIndicator.always,
        thumbColor: Colors.white,
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: TailwindColors.gray900,
        unselectedLabelColor: TailwindColors.gray500,
        labelPadding: EdgeInsets.all(AppDefaults.padding),
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: TailwindColors.gray900,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: TailwindColors.gray500,
        ),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: TailwindColors.gray900,
            width: 2,
          ),
        ),
      ),
    );
  }

  /* <---- Input Decorations Theme -----> */
  static const defaultInputDecorationTheme = InputDecorationTheme(
    fillColor: TailwindColors.gray50,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: OutlineInputBorder(
      borderSide: BorderSide(width: 0.1),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 0.1),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 0.1),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    suffixIconColor: TailwindColors.gray500,
  );

  static const secondaryInputDecorationTheme = InputDecorationTheme(
    fillColor: TailwindColors.gray100,
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
  );

  static final otpInputDecorationTheme = InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: OutlineInputBorder(
      borderSide: const BorderSide(width: 0.1),
      borderRadius: BorderRadius.circular(25),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 0.1),
      borderRadius: BorderRadius.circular(25),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 0.1),
      borderRadius: BorderRadius.circular(25),
    ),
  );
}
