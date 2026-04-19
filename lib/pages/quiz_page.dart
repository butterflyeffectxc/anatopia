import 'package:flutter/material.dart';
import 'package:my_body/pages/score_page.dart';
import '../models/quiz.dart';
import '../theme/style.dart'; // <-- file style lu

class QuizPage extends StatefulWidget {
  final List<Quiz> quizList;

  const QuizPage({super.key, required this.quizList});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late List<Quiz> questions;

  int currentIndex = 0;
  int score = 0;

  bool answered = false;
  String selectedAnswer = "";

  late List<String> currentOptions;

  @override
  void initState() {
    super.initState();
    questions = List.from(widget.quizList);
    questions.shuffle();
    questions = questions.take(5).toList(); // 
    loadQuestion();
  }

  void loadQuestion() {
    currentOptions = List.from(questions[currentIndex].options);
    currentOptions.shuffle();

    answered = false;
    selectedAnswer = "";
  }

  void selectAnswer(String answer) {
    if (answered) return;

    setState(() {
      answered = true;
      selectedAnswer = answer;

      if (answer == questions[currentIndex].correctAnswer) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        loadQuestion();
      });
    } else {
      showResult();
    }
  }

  void showResult() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ScorePage(score: score, total: questions.length),
      ),
    );
  }

  // ================= UI LOGIC =================

  Color getBackgroundColor() {
    if (!answered) return Colors.white;

    if (selectedAnswer == questions[currentIndex].correctAnswer) {
      return const Color(0xFFE4FEE3);
    } else {
      return const Color(0xFFF4D2D0);
    }
  }

  Color getOptionColor(String option) {
    if (!answered) return AppColors.orange;

    if (option == questions[currentIndex].correctAnswer) {
      return AppColors.green;
    }

    if (option == selectedAnswer) {
      return Colors.red;
    }

    return AppColors.lightgrey;
  }

  Border? getBorder(String option) {
    if (answered && option == selectedAnswer) {
      return Border.all(color: AppColors.blue, width: 3);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentIndex];

    return Scaffold(
      backgroundColor: getBackgroundColor(),
      appBar: AppBar(title: const Text("Quiz"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // PROGRESS
            Text(
              "${currentIndex + 1} / ${questions.length}",
              style: AppText.span.copyWith(color: AppColors.grey),
            ),

            const SizedBox(height: 10),

            // QUESTION
            Text(q.question, style: AppText.h4, textAlign: TextAlign.center),

            const SizedBox(height: 20),

            // GIF / IMAGE
            Expanded(child: Image.asset(q.image, fit: BoxFit.contain)),

            const SizedBox(height: 10),

            // RESULT TEXT
            if (answered)
              Text(
                selectedAnswer == q.correctAnswer
                    ? "CORRECT!"
                    : "OOPS! INCORRECT",
                style: AppText.h4.copyWith(
                  color: selectedAnswer == q.correctAnswer
                      ? AppColors.green
                      : Colors.red,
                ),
              ),

            const SizedBox(height: 20),

            // OPTIONS
            GridView.builder(
              shrinkWrap: true,
              itemCount: currentOptions.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.8,
              ),
              itemBuilder: (context, index) {
                final option = currentOptions[index];

                return GestureDetector(
                  onTap: () => selectAnswer(option),
                  child: Container(
                    decoration: BoxDecoration(
                      color: getOptionColor(option),
                      borderRadius: BorderRadius.circular(20),
                      border: getBorder(option),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      option,
                      style: AppText.span.copyWith(color: Colors.white),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // NEXT BUTTON
            if (answered)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: AppButton.primary,
                  onPressed: nextQuestion,
                  child: const Text("Next"),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
