import 'package:flutter/material.dart';

class AppColors {
  static const yellow = Color(0xFFFFC107);
  static const green = Color(0xFF4CAF50);
  static const blue = Color(0xFF2196F3);
  static const orange = Color(0xFFFF8A00);
  static const lightgrey = Color(0xFF9CA3AF);
  static const grey = Color(0xFF6B7280);
  // cara pake
  // Container(
  //   decoration: BoxDecoration(
  //     color: AppColors.orange,
  //     borderRadius: AppRadius.button,
  //   ),
  //   child: Text(
  //     "A. Thigh",
  //     style: AppText.option,
  //   ),
  // )
}

class AppText {
  static const h1 = TextStyle(
    fontSize: 56,
    fontWeight: FontWeight.bold,
    fontFamily: 'Fredoka',
  );
  static const h2 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    fontFamily: 'Fredoka',
  );
  static const h3 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    fontFamily: 'Fredoka',
  );
  static const h4 = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    fontFamily: 'Fredoka',
  );
  static const h5 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    fontFamily: 'Fredoka',
  );
  static const span = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: 'Fredoka',
  );
}

class AppButton {
  static ButtonStyle primary = ElevatedButton.styleFrom(
    backgroundColor: AppColors.yellow,
    foregroundColor: Colors.white,
    textStyle: const TextStyle(fontWeight: FontWeight.bold),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );

  static ButtonStyle tertiary = ElevatedButton.styleFrom(
    backgroundColor: AppColors.orange,
    foregroundColor: Colors.white,
    textStyle: const TextStyle(fontWeight: FontWeight.bold),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );

  static ButtonStyle secondary = ElevatedButton.styleFrom(
    backgroundColor: AppColors.lightgrey,
    foregroundColor: AppColors.grey,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );
  // cara pake
  // ElevatedButton(
  //   style: AppButton.primary,
  //   onPressed: () {},
  //   child: const Text("Play"),
  // )
}
