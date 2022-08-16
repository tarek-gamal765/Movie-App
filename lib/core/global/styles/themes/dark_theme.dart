import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/core/global/styles/app_colors/app_colors_dark.dart';
import 'package:movie_app/core/global/styles/font_styles/font_styles.dart';
import 'package:movie_app/core/utils/font_manager.dart';
import 'package:movie_app/core/utils/values_manager.dart';

ThemeData darkTheme() => ThemeData(
      primaryColor: AppColorsDark.primaryColor,
      brightness: Brightness.dark,
      errorColor: AppColorsDark.redAccentColor,
      scaffoldBackgroundColor: AppColorsDark.primaryColor,
      splashColor: AppColorsDark.lightBlackColor,
      fontFamily: FontConstants.fontFamily,
      hoverColor: AppColorsDark.lightGreyColor,
      dividerColor: AppColorsDark.darkGreyColor,
      dividerTheme: const DividerThemeData(
        color: AppColorsDark.darkGreyColor,
        thickness: AppSize.s1,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColorsDark.transparentColor,
        elevation: AppSize.s0,
        centerTitle: false,
        iconTheme: IconThemeData(
          size: AppSize.s20,
          color: AppColorsDark.whiteColor,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColorsDark.blackColor,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      iconTheme: const IconThemeData(
        size: AppSize.s16,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColorsDark.redAccentColor,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColorsDark.whiteColor,
        height: AppSize.s40,
        textTheme: ButtonTextTheme.primary,
        padding: EdgeInsets.all(AppPadding.p10),
      ),
      textTheme: TextTheme(
        headline5: getRegularStyle(
          color: AppColorsDark.whiteColor,
          fontSize: FontSize.s18,
        ),
        subtitle1: getMediumStyle(
          color: AppColorsDark.whiteColor,
          fontSize: FontSize.s16,
        ),
        subtitle2: getRegularStyle(
          color: AppColorsDark.whiteColor,
          fontSize: FontSize.s14,
        ),
        bodyText1: getRegularStyle(
          color: AppColorsDark.whiteColor,
          fontSize: FontSize.s13,
        ),
        bodyText2: getRegularStyle(
          color: AppColorsDark.greyColor,
          fontSize: FontSize.s14,
        ),
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColorsDark.primaryColor,
        onPrimary: AppColorsDark.primaryColor,
        secondary: AppColorsDark.redAccentColor,
        onSecondary: AppColorsDark.whiteColor,
        error: AppColorsDark.redAccentColor,
        onError: AppColorsDark.whiteColor,
        background: AppColorsDark.primaryColor,
        onBackground: AppColorsDark.whiteColor,
        surface: AppColorsDark.primaryColor,
        onSurface: AppColorsDark.whiteColor,
        primaryContainer: AppColorsDark.redAccentColor,
        secondaryContainer: AppColorsDark.primaryColor,
      ),
    );
