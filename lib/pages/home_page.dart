import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../data/body_parts_data.dart';
import '../models/body_part.dart';
import 'intro_page.dart';
import '../theme/style.dart';
import '../data/quiz_data.dart';
import 'intro_quiz_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void openIntro(BuildContext context, BodyPart bodyPart) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IntroPage(bodyPart: bodyPart)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<BodyPart> mainParts = bodyParts.where((part) {
      return part.nameEnglish == 'Head' ||
          part.nameEnglish == 'Body' ||
          part.nameEnglish == 'Legs';
    }).toList();

    return Scaffold(
      extendBody: true, // 🔥 biar navbar transparan
      backgroundColor: Colors.grey.shade100,

      body: Stack(
        children: [
          // ===== MAIN CONTENT =====
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                20,
                20,
                90,
              ), // bawah dikasih space buat navbar
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/home_head.svg", height: 80),

                  const SizedBox(height: 10),

                  const Text(
                    "Hello, Bayi Bajang",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "Ready To Learn?",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Pick your first topic and start the adventure!",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),

                  Expanded(
                    child: GridView.builder(
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                          ),
                      itemBuilder: (context, index) {
                        if (index < mainParts.length) {
                          final part = mainParts[index];

                          Color bgColor;
                          if (part.nameEnglish == "Head") {
                            bgColor = Colors.orange;
                          } else if (part.nameEnglish == "Body") {
                            bgColor = Colors.blue;
                          } else {
                            bgColor = Colors.red;
                          }

                          return GestureDetector(
                            onTap: () => openIntro(context, part),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(part.image, height: 70),
                                        const SizedBox(height: 10),
                                        Text(
                                          "${part.nameEnglish} Area",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const Text(
                                          "1 min",
                                          style: TextStyle(
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Icon(
                                        Icons.music_note,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Center(
                              child: Text(
                                "Coming Soon",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ===== NAVBAR =====
          Positioned(
            left: 16,
            right: 16,
            bottom: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.25),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _navItem(context, Icons.home, "Home", true),
                  _navItem(context, Icons.videogame_asset, "Games", false),
                  _navItem(context, Icons.person, "Profile", false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(
    BuildContext context,
    IconData icon,
    String label,
    bool active,
  ) {
    return GestureDetector(
      onTap: () {
        if (label == "Games") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => IntroQuizPage(
                quizList: quizList, // dari data lu
              ),
            ),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: active
                  ? AppColors.yellow.withOpacity(0.3)
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: active ? AppColors.yellow : AppColors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppText.span.copyWith(
              color: active ? AppColors.yellow : AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
