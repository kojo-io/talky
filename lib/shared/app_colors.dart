import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const primary = Color(0xFF377DFF);
  static const gray = Color(0xFFF7F7F9);
  static const chatGray = Color(0xFFF7F7F9);
  static const textColor = Color(0xFF243443);
  static const grayDark = Color(0xFFAAB0B7);
  static const buttonGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0x00FFFFFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const shadow = Color(0x1A000000);
  static const dividerColor = Color(0xFF58616A);
  static const inputBorderColor = Color(0xFFAAB0B7);
  static const availableColor = Color(0xFF2DCABC);
  static const tabBgColor = Color(0xFFF7F7F9);
}