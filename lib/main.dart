import 'package:flutter/material.dart';
import 'pages/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perkenalan Anggota Tubuh',
      theme: ThemeData(
        fontFamily: 'Fredoka',
        colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.pink.shade200,
      ),
      ),
      home: const OnboardingPage(),
    );
  }
}
