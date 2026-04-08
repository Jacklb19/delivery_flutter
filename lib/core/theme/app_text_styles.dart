import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Lobster Font
  static TextStyle get lobsterDisplay => GoogleFonts.lobster(
        color: AppColors.textPrimary,
      );

  // Poppins Font
  static TextStyle get poppinsHeading => GoogleFonts.poppins(
        color: AppColors.textPrimary,
      );

  // Roboto Font
  static TextStyle get robotoText => GoogleFonts.roboto(
        color: AppColors.textPrimary,
      );

  // Inter Font
  static TextStyle get interText => GoogleFonts.inter(
        color: AppColors.textPrimary,
      );
}
