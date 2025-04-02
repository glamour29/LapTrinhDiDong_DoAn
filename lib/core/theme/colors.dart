import 'package:flutter/material.dart';

class AppColors {
  static List<AppColors> get list => [
        darkColors,

        /// pinkColors,
        brownColors,

        /// orangeColors
      ];

  static AppColors get orangeColors => AppColors(
        id: 3,
        brightness: Brightness.light,
        background: Color(0xFFDD8F1E),
        // Cam sáng nhẹ nhàng
        buttonBackgroundColor: Color(0xFFC47B20),
        // Cam đậm
        scaffoldBackgroundColor: Color(0xFFFFCC80),
        // Cam pastel nhạt
        progressColor: Colors.white,
        dividerColor: Colors.black26,
        radioSelectedColor: Color(0xFFFF7043), // Cam trung tính
      );

  static AppColors get brownColors => AppColors(
        id: 2,
        brightness: Brightness.dark,
        background: Color(0xFF795548),
        // Nâu đất trung tính
        buttonBackgroundColor: Color(0xFF5D4037),
        // Nâu đậm
        scaffoldBackgroundColor: Color(0xFFB2A9A6),
        // Nâu kem nhạt
        progressColor: Colors.white,
        dividerColor: Colors.white38,
        radioSelectedColor: Color(0xFFA1887F), // Nâu pastel
      );

  static AppColors get pinkColors => AppColors(
        id: 1,
        brightness: Brightness.light,
        background: Color(0xFFBB9895),
        // Hồng nhạt nhẹ nhàng
        buttonBackgroundColor: Color(0xFFFAAEC8),
        // Hồng phấn
        scaffoldBackgroundColor: Color(0xFFD2B4B1),
        // Hồng rất nhạt
        progressColor: Colors.black54,
        // Tạo điểm nhấn dịu mắt
        dividerColor: Colors.black26,
        radioSelectedColor: Color(0xFFF48FB1), // Hồng pastel nhẹ
      );

  static AppColors get darkColors => AppColors(
        id: 0,
        brightness: Brightness.dark,
        background: Color(0xFF232222),
        buttonBackgroundColor: Color(0xFF333333),
        scaffoldBackgroundColor: Color(0xFF3B3A3A),
        progressColor: Colors.white,
        dividerColor: Colors.white38,
        radioSelectedColor: Colors.green,
      );

  final int id;
  final Brightness brightness;
  final Color background;
  final Color buttonBackgroundColor;
  final Color scaffoldBackgroundColor;
  final Color progressColor;
  final Color dividerColor;
  final Color radioSelectedColor;

  AppColors({
    required this.id,
    required this.brightness,
    required this.background,
    required this.buttonBackgroundColor,
    required this.scaffoldBackgroundColor,
    required this.progressColor,
    required this.dividerColor,
    required this.radioSelectedColor,
  });
}
