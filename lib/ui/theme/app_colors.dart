import 'package:flutter/material.dart';

class AppColors {
  const AppColors({
    required this.background,
    required this.accent,
    required this.disabled,
    required this.error,
    required this.divider,
    required this.signIn,
    required this.signOut,
  });

  factory AppColors.light() {
    return const AppColors(
      background: Colors.white,
      accent: Color(0xFF3E74BD),
      disabled: Colors.black12,
      error: Color(0xffff7466),
      divider: Colors.black54,
      signIn: Color(0xff4285f4),
      signOut: Color(0xffc53829),
    );
  }

  factory AppColors.dark() {
    return const AppColors(
      background: Color(0xff121212),
      accent: Color(0xff17c063),
      disabled: Colors.white12,
      error: Color(0xffff5544),
      divider: Colors.white54,
      signIn: Color(0xff4285f4),
      signOut: Color(0xffc53829),
    );
  }

  final Color background;
  final Color accent;
  final Color disabled;
  final Color error;
  final Color divider;

  final Color signIn;
  final Color signOut;
}