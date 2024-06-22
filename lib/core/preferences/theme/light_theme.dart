import 'package:flutter/material.dart';
import 'package:kasir_super/core/core.dart';

class LightTheme {
  LightTheme(this.primaryColor);
  final Color primaryColor;

  final Color errorColor = AppColors.red;
  final Color scaffoldColor = AppColors.white;
  final Color textSolidColor = AppColors.black[800]!;
  final Color textDisableColor = AppColors.black[400]!;
  final Color borderColor = AppColors.white[500]!;
  final Color disabledColor = AppColors.black[200]!;
  final Color inputColor = AppColors.white;
  final Color dividerColor = AppColors.white[400]!;

  final String fontFamily = 'Poppins';

  ColorScheme get colorScheme {
    return ColorScheme.light(
      primary: primaryColor,
      secondary: primaryColor,
      error: errorColor,
    );
  }

  TextTheme get textTheme => TextTheme(
        headlineLarge: TextStyle(
          fontSize: Dimens.dp32,
          color: textSolidColor,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          fontSize: Dimens.dp24,
          fontWeight: FontWeight.w600,
          color: textSolidColor,
        ),
        headlineSmall: TextStyle(
          fontSize: Dimens.dp20,
          fontWeight: FontWeight.w600,
          color: textSolidColor,
        ),
        titleLarge: TextStyle(
          fontSize: Dimens.dp16,
          fontWeight: FontWeight.w600,
          color: textSolidColor,
        ),
        titleMedium: TextStyle(
          fontSize: Dimens.dp14,
          fontWeight: FontWeight.w600,
          color: textSolidColor,
        ),
        bodyLarge: TextStyle(
            fontSize: Dimens.dp16,
            fontWeight: FontWeight.w500,
            color: textSolidColor),
        bodyMedium: TextStyle(
          fontSize: Dimens.dp14,
          fontWeight: FontWeight.normal,
          color: textSolidColor,
        ),
        labelMedium: TextStyle(
          fontSize: Dimens.dp12,
          fontWeight: FontWeight.w500,
          color: textDisableColor,
        ),
      );

  AppBarTheme get appBarTheme => AppBarTheme(
        centerTitle: false,
        surfaceTintColor: scaffoldColor,
        iconTheme: IconThemeData(color: primaryColor),
      );

  CardTheme get cardTheme => CardTheme(
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.dp8),
          side: BorderSide(color: borderColor),
        ),
      );

  BottomNavigationBarThemeData get bottomNavigationBarTheme {
    return BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryColor,
      unselectedItemColor: disabledColor,
      selectedLabelStyle: textTheme.labelMedium?.copyWith(
        fontSize: Dimens.dp10,
        color: primaryColor,
      ),
      unselectedLabelStyle: textTheme.labelMedium?.copyWith(
        fontSize: Dimens.dp10,
        color: disabledColor,
      ),
    );
  }

  ElevatedButtonThemeData get elevatedButtonTheme {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.dp8),
      ),
      backgroundColor: primaryColor,
      foregroundColor: scaffoldColor,
      textStyle: textTheme.labelMedium,
    ));
  }

  OutlinedButtonThemeData get outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.dp8),
        ),
        side: BorderSide(
          color: primaryColor,
        ),
        foregroundColor: primaryColor,
        textStyle: textTheme.titleMedium,
      ),
    );
  }

  InputDecorationTheme get inputDecorationTheme {
    return InputDecorationTheme(
      fillColor: inputColor,
      filled: true,
      hintStyle: textTheme.labelMedium,
      prefixIconColor: textDisableColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: Dimens.defaultSize,
        vertical: Dimens.dp12,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimens.dp8),
        borderSide: BorderSide(color: inputColor),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimens.dp8),
        borderSide: BorderSide(color: inputColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimens.dp8),
        borderSide: BorderSide(color: primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimens.dp8),
        borderSide: BorderSide(color: errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimens.dp8),
        borderSide: BorderSide(color: errorColor),
      ),
    );
  }

  DividerThemeData get dividerTheme {
    return DividerThemeData(
      color: dividerColor,
      space: Dimens.dp24,
    );
  }

  ThemeData get theme {
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      primaryColor: primaryColor,
      textTheme: textTheme,
      fontFamily: fontFamily,
      appBarTheme: appBarTheme,
      cardTheme: cardTheme,
      disabledColor: disabledColor,
      bottomNavigationBarTheme: bottomNavigationBarTheme,
      elevatedButtonTheme: elevatedButtonTheme,
      outlinedButtonTheme: outlinedButtonTheme,
      inputDecorationTheme: inputDecorationTheme,
      dividerColor: dividerColor,
      dividerTheme: dividerTheme,
    );
  }
}
