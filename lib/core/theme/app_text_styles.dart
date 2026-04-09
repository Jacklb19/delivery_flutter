import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Lobster — logo / splash
  static TextStyle get lobsterDisplay => GoogleFonts.lobster(
        color: AppColors.textPrimary,
        letterSpacing: 0,
      );

  // Poppins — headings
  static TextStyle get poppinsHeading => GoogleFonts.poppins(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      );

  static TextStyle get poppinsBold => GoogleFonts.poppins(
        color: AppColors.primary,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      );

  // Roboto — body text
  static TextStyle get robotoText => GoogleFonts.roboto(
        color: AppColors.textPrimary,
        letterSpacing: 0,
      );

  static TextStyle get robotoSemiBold => GoogleFonts.roboto(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      );

  static TextStyle get robotoMedium => GoogleFonts.roboto(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      );

  static TextStyle get robotoRegular => GoogleFonts.roboto(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      );

  // Inter — category buttons
  static TextStyle get interText => GoogleFonts.inter(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      );
}
