import 'package:art_selling_platform/utils/themes/custom_themes/appbar_theme.dart';
import 'package:art_selling_platform/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

import 'custom_themes/t_botton_sheet_theme.dart';
import 'custom_themes/t_check_box_theme.dart';
import 'custom_themes/t_elevated_button_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_filed_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TTextTheme.lightTextTheme,
      appBarTheme: TappbarTheme.lightAppbarTheme,
      bottomSheetTheme: TbottonSheetTheme.lightBottomSheetTheme,
      chipTheme: TChipTheme.lightChipTheme,
      checkboxTheme: Tcheckboxtheme.lightCheckboxTheme,
      elevatedButtonTheme: TelevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonThemeData,
      inputDecorationTheme: TTextFiledTheme.lightInputDecorationTheme);
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TTextTheme.darkTextTheme,
      appBarTheme: TappbarTheme.lightAppbarTheme,
      bottomSheetTheme: TbottonSheetTheme.lightBottomSheetTheme,
      chipTheme: TChipTheme.darkChipTheme,
      checkboxTheme: Tcheckboxtheme.darkCheckboxTheme,
      elevatedButtonTheme: TelevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonThemeData,
      inputDecorationTheme: TTextFiledTheme.darkInputDecorationTheme);
}
