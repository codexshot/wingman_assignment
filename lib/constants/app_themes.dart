import 'package:flutter/material.dart';

import 'app_colors.dart';

mixin AppThemes {

  static ThemeData LightModeTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.bgColor,
    fontFamily: "PlusJakartaSans",
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      elevation: 0,

    ),
  );
}
