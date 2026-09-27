import 'package:flutter/material.dart';

/// Deep Navy + Emerald Green fintech palette — CRED/Google Wallet inspired
abstract class AppColors {
  // --- Primary: Deep Navy ---
  static const Color primary = Color(0xFF0A1628);
  static const Color primaryLight = Color(0xFF1A2E4A);
  static const Color primaryDark = Color(0xFF050D1A);

  // --- Accent: Emerald Green ---
  static const Color accent = Color(0xFF00C896);
  static const Color accentLight = Color(0xFF33D4AB);
  static const Color accentDark = Color(0xFF009E78);

  // --- Semantic Colors ---
  static const Color success = Color(0xFF00C896);
  static const Color warning = Color(0xFFFFB347);
  static const Color error = Color(0xFFFF5C5C);
  static const Color info = Color(0xFF4A9EFF);

  // --- Neutral (Light Mode) ---
  static const Color surface = Color(0xFFF8F9FB);
  static const Color surfaceVariant = Color(0xFFEEF1F5);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color divider = Color(0xFFE0E5EC);
  static const Color textPrimary = Color(0xFF0A1628);
  static const Color textSecondary = Color(0xFF6B7A99);
  static const Color textHint = Color(0xFFADB5C8);

  // --- Neutral (Dark Mode) ---
  static const Color darkSurface = Color(0xFF0D1B2A);
  static const Color darkSurfaceVariant = Color(0xFF162033);
  static const Color darkCard = Color(0xFF1A2B3E);
  static const Color darkDivider = Color(0xFF243347);
  static const Color darkTextPrimary = Color(0xFFF0F4FA);
  static const Color darkTextSecondary = Color(0xFF8FA3BF);

  // --- Category Colors ---
  static const Color catGroceries = Color(0xFF4CAF50);
  static const Color catFood = Color(0xFFFF7043);
  static const Color catTransport = Color(0xFF42A5F5);
  static const Color catHealthcare = Color(0xFFEC407A);
  static const Color catShopping = Color(0xFFAB47BC);
  static const Color catUtilities = Color(0xFFFFCA28);
  static const Color catEntertainment = Color(0xFF26C6DA);
  static const Color catEducation = Color(0xFF5C6BC0);
  static const Color catTravel = Color(0xFF26A69A);
  static const Color catBusiness = Color(0xFF78909C);
  static const Color catRent = Color(0xFFFF7043);
  static const Color catOther = Color(0xFF90A4AE);

  // --- Gradient ---
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLight, primary],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentLight, accentDark],
  );

  static const LinearGradient heroCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1A2E4A), Color(0xFF0A1628)],
  );
}
