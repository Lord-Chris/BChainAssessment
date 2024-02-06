import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '_constants.dart';

class AppTheme {
  static final theme = ThemeData(
    primarySwatch: Colors.indigo,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary70),
    fontFamily: AppTextStyles.ibmPlexSans,
    scaffoldBackgroundColor: AppColors.white,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(size: 17.sp),
      surfaceTintColor: AppColors.white,
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      tilePadding: EdgeInsets.symmetric(vertical: 4),
    ),
    // radioTheme: RadioThemeData(
    //   fillColor: MaterialStateProperty.resolveWith(
    //     (states) => states.isEmpty ? AppColors.lightColor3 : null,
    //   ),
    // ),
    // checkboxTheme: CheckboxThemeData(
    //   fillColor: MaterialStateProperty.resolveWith(
    //     (states) => states.isEmpty ? AppColors.lightColor3 : null,
    //   ),
    // ),
  );
}
