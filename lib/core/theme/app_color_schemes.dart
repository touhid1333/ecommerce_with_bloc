part of "theme.dart";

class AppColors {
  static const Color primaryColor = Color(0xFFF05A28);
  static const Color secondaryColor = Color(0xFFD31D55);
  static const Color tertiaryColor = Color(0xFF4AC7EC);
  static const Color hintColor = Color(0xFF999999);
  static const Color errorColor = Color(0xFFcc3300);
  static const Color successColor = Color(0xFF339900);
  static const Color scaffoldBackgroundColor = CupertinoColors.systemGrey6;
  static const Color darkScaffoldBackgroundColor = Colors.black45;
}

class AppColorSchemes {
  // --------------------------------------
  // Light Color scheme
  // --------------------------------------
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primaryColor,
    onPrimary: Colors.white,
    secondary: AppColors.secondaryColor,
    onSecondary: Colors.white,
    error: AppColors.errorColor,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
    outline: AppColors.hintColor,
    tertiary: AppColors.tertiaryColor,
    onTertiary: Colors.white,
  );

  // --------------------------------------
  // Dark Color scheme
  // --------------------------------------
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryColor,
    onPrimary: Colors.white,
    secondary: AppColors.secondaryColor,
    onSecondary: Colors.white,
    error: AppColors.errorColor,
    onError: Colors.white,
    surface: Colors.black,
    onSurface: Colors.white,
    outline: AppColors.hintColor,
    tertiary: AppColors.tertiaryColor,
    onTertiary: Colors.white,
  );
}
