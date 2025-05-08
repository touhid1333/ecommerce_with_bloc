part of "theme.dart";

class AppColors {
  static const Color primaryColor = Color(0xFF4E4AF2);
  static const Color secondaryColor = Color(0xFF181C24);
  static const Color hintColor = Color(0xFF999999);
  static const Color errorColor = Colors.redAccent;
  static const Color successColor = Color(0xFF339900);
  static const Color scaffoldBackgroundColor = Color(0xFF222834);
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
    surface: Colors.black,
    onSurface: Colors.white,
    outline: AppColors.hintColor,
  );

  // --------------------------------------
  // Dark Color scheme
  // --------------------------------------
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primaryColor,
    onPrimary: Colors.white,
    secondary: AppColors.secondaryColor,
    onSecondary: Colors.white,
    error: AppColors.errorColor,
    onError: Colors.white,
    surface: Colors.black,
    onSurface: Colors.white,
    outline: AppColors.hintColor,
  );
}
