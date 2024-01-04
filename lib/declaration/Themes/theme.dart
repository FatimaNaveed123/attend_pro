import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Constants/constants.dart';

class ThemeClass {
  Color lightPrimaryColor = HexColor('#00000');
  Color darkPrimaryColor = HexColor('#fffff');

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light()
        .copyWith(primary: _themeClass.lightPrimaryColor),
    // - - - - -Light Theme Elevated Button Styles - - - - -
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 55),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => _themeClass.lightPrimaryColor),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (_) {
            return RoundedRectangleBorder(borderRadius: kBorderRadius);
          },
        ),
        textStyle: MaterialStateProperty.resolveWith(
          (states) => const TextStyle(
              fontWeight: FontWeight.normal, fontSize: 23, color: Colors.white),
        ),
        foregroundColor:
            MaterialStateProperty.all<Color>(Colors.white), // actual text color
      ),
    ),
    // - - - - - - - - - - - - - - -  - - - - -
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark()
        .copyWith(primary: _themeClass.darkPrimaryColor),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 55),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => HexColor('#800080')), // Black background color
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (_) {
            return RoundedRectangleBorder(borderRadius: kBorderRadius);
          },
        ),
        textStyle: MaterialStateProperty.resolveWith(
          (states) =>
              const TextStyle(fontWeight: FontWeight.normal, fontSize: 23),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
            HexColor('#800080')), // Purple text color
      ),
    ),

    // - - - - -Dark Theme Elevated Button Styles - - - - -
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ButtonStyle(
    //     minimumSize: MaterialStateProperty.all(
    //       const Size(double.infinity, 55),
    //     ),
    //     backgroundColor: MaterialStateProperty.resolveWith<Gradient>(
    //       (Set<MaterialState> states) {
    //         // Use a LinearGradient for the background color
    //         return LinearGradient(
    //           colors: [HexColor('#FF4081'), HexColor('#FF79B0')],
    //         );
    //       },
    //     ),
    //     shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
    //       (_) {
    //         return RoundedRectangleBorder(borderRadius: kBorderRadius);
    //       },
    //     ),
    //     textStyle: MaterialStateProperty.resolveWith(
    //       (Set<MaterialState> states) =>
    //           const TextStyle(fontWeight: FontWeight.normal, fontSize: 23),
    //     ),
    //     foregroundColor: MaterialStateProperty.all<Color>(
    //       HexColor('#800080'), // Purple text color
    //     ),
    //   ),
    // ),

    // - - - - - - - - - - - - - - -  - - - - -
  );
}

ThemeClass _themeClass = ThemeClass();
