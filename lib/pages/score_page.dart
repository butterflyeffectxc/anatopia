import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/style.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int total;

  const ScorePage({
    super.key,
    required this.score,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // BACKGROUND
          Positioned.fill(
            child: SvgPicture.asset(
              "assets/images/bg_quiz.svg",
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  // LOGO
                  SvgPicture.asset(
                    "assets/images/icon_quiztopia.svg",
                    height: 40,
                  ),

                  const Spacer(),

                  // EMOJI 
                  SvgPicture.asset(
                    "assets/images/icon_hore.svg",
                    height: 120,
                  ),

                  const SizedBox(height: 20),

                  // TITLE
                  Text(
                    "Hooray!",
                    style: AppText.h2.copyWith(color: Colors.white),
                  ),

                  const SizedBox(height: 10),

                  // SCORE TEXT
                  Text(
                    "Great job! You answered\n$score questions right!",
                    textAlign: TextAlign.center,
                    style: AppText.span.copyWith(color: Colors.white),
                  ),

                  const SizedBox(height: 10),

                  // SUB TEXT
                  Text(
                    "You're getting super smart!",
                    style: AppText.span.copyWith(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),

                  const Spacer(),

                  // FOOTER TEXT
                  Text(
                    "Ready to learn even more?",
                    style: AppText.span.copyWith(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: AppButton.primary.copyWith(
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      child: Text(
                        "Back to Home",
                        style: AppText.span.copyWith(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}