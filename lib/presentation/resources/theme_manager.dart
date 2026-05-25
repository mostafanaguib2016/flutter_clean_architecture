import 'package:flutter_clean_architecture/presentation/resources/color_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/font_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/styles_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    // colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,
    // card theme
    cardTheme: CardThemeData(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSizes.s8
    ),
    // appbar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      shadowColor: ColorManager.lightPrimary,
      elevation: AppSizes.s4,
      titleTextStyle: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s16),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.s8)
      ),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s18),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.s12)
        ),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: getBoldStyle(color: ColorManager.white),
      headlineMedium: getSemiBoldStyle(color: ColorManager.white),
      titleLarge: getBoldStyle(color: ColorManager.grey),
      displayLarge: getBoldStyle(color: ColorManager.white,fontSize: FontSize.s22),
      displayMedium: getSemiBoldStyle(color: ColorManager.txtGrey,fontSize: FontSize.s16),
      displaySmall: getMediumStyle(color: ColorManager.txtGrey,fontSize: FontSize.s14),
      headlineSmall: getRegularStyle(color: ColorManager.txtGrey,fontSize: FontSize.s14),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPaddings.p8),
      hintStyle: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s14),
      labelStyle: getMediumStyle(color: ColorManager.grey,fontSize: FontSize.s14),
      errorStyle: getMediumStyle(color: ColorManager.error,fontSize: FontSize.s14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.s4),
        borderSide: BorderSide(color: ColorManager.grey,width: AppSizes.s1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.s4),
        borderSide: BorderSide(color: ColorManager.primary,width: AppSizes.s1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.s4),
        borderSide: BorderSide(color: ColorManager.error,width: AppSizes.s1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.s4),
        borderSide: BorderSide(color: ColorManager.error,width: AppSizes.s1),
      ),
    ),
  );
}