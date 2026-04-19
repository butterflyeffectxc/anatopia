import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/body_part.dart';
import 'detail_page.dart';

class IntroPage extends StatelessWidget {
  final BodyPart bodyPart;

  const IntroPage({super.key, required this.bodyPart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // background
          Positioned.fill(
            child: Image.asset(
              "assets/images/bg_orange.png",
              fit: BoxFit.cover,
            ),
          ),
          // content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Spacer(),

                  // intro image
                  Image.asset(bodyPart.introImage, height: 120),

                  const SizedBox(height: 30),

                  // TITLE
                  Text(
                    "${bodyPart.nameEnglish} Area",
                    style: const TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Learning Program",
                    style: TextStyle(fontSize: 24, color: Colors.white70),
                  ),

                  const SizedBox(height: 12),

                  // DURATION
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.access_time, color: Colors.white),
                      SizedBox(width: 6),
                      Text(
                        "1 min",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // DESCRIPTION
                  const Text(
                    "We will learn all parts on your head\nfrom hair to neck",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),

                  const Spacer(),

                  // BUTTONS
                  Row(
                    children: [
                      // NOT NOW
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade300,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ), // 👈 kecilin ini
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Not Now",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      // LEARN NOW
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFC107),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ), // 👈 kecilin ini
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(bodyPart: bodyPart),
                              ),
                            );
                          },
                          child: const Text(
                            "Learn Now",
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
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
