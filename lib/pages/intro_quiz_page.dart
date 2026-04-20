import 'package:flutter/material.dart';
import 'package:my_body/pages/quiz_page.dart';
import '../models/quiz.dart';
import '../theme/style.dart';

class IntroQuizPage extends StatelessWidget {
  final List<Quiz> quizList;

  const IntroQuizPage({super.key, required this.quizList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/bg_quiz.png",
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),
              child: Column(
                children: [
                  const Spacer(),

                  Image.asset(
                    "assets/images/icon_quiztopia.png",
                    height: 120,
                  ),

                  const SizedBox(height: 24),

                  Text(
                    "Mini Quiz",
                    style: AppText.h4.copyWith(color: Colors.white),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.access_time, color: Colors.white, size: 20),
                      const SizedBox(width: 6),
                      Text(
                        "${quizList.length} Questions",
                        style: AppText.span.copyWith(color: Colors.white),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Text(
                    "Let’s see what you remember about your body!",
                    textAlign: TextAlign.center,
                    style: AppText.span.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),

                  const Spacer(),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: AppButton.secondary.copyWith(
                            padding: WidgetStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 16),
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "Not Now",
                            style: AppText.span.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: ElevatedButton(
                          style: AppButton.primary.copyWith(
                            padding: WidgetStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 16),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => QuizPage(
                                  quizList: quizList,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Let's Go!",
                            style: AppText.span.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}