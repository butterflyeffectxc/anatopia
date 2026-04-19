import 'package:flutter/material.dart';
import '../theme/style.dart';
import 'splash_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController controller = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> pages = [
    {
      "image": "assets/images/icon_onboard.png",
      "title": "Explore",
      "desc": "36 fascinating body parts for your little one to explore!",
    },
    {
      "image": "assets/images/icon_onboard.png",
      "title": "Visualize",
      "desc":
          "Watch short, engaging videos that explain the functions of every body part in a fun way!",
    },
    {
      "image": "assets/images/icon_onboard.png",
      "title": "Interact",
      "desc":
          "Let’s make learning more interactive and exciting for your little one with Anatopia!",
    },
  ];

  void nextPage() {
    if (currentIndex < pages.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // TODO: pindah ke home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SplashPage()),
      );
    }
  }

  void skip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const SplashPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: Stack(
        children: [
          // ===== BACKGROUND FULL 1 LAYAR =====
          Positioned.fill(
            child: Image.asset("assets/images/bg_white.png", fit: BoxFit.cover),
          ),

          // ===== CONTENT =====
          SafeArea(
            child: Column(
              children: [
                // SKIP
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: skip,
                    child: Text(
                      "Skip",
                      style: AppText.span.copyWith(color: Colors.white),
                    ),
                  ),
                ),

                // SLIDER (INI YANG LU BILANG KEPOTONG)
                Expanded(
                  child: PageView.builder(
                    controller: controller,
                    itemCount: pages.length,
                    onPageChanged: (index) {
                      setState(() => currentIndex = index);
                    },
                    itemBuilder: (context, index) {
                      final page = pages[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 30),
                            Image.asset("assets/images/logo.png", height: 70,),
                            const Spacer(),
                            Image.asset(page["image"]!, height: 350),

                            const SizedBox(height: 30),

                            Text(
                              page["title"]!,
                              style: AppText.h2.copyWith(
                                color: AppColors.yellow,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              page["desc"]!,
                              textAlign: TextAlign.center,
                              style: AppText.span.copyWith(color: Colors.black),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // DOT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(pages.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: currentIndex == index ? 10 : 8,
                      height: currentIndex == index ? 10 : 8,
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? AppColors.yellow
                            : Colors.white54,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 20),

                // BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: AppButton.primary.copyWith(
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                      onPressed: nextPage,
                      child: Text(
                        currentIndex == pages.length - 1 ? "Start" : "Next",
                        style: AppText.span.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
      // body: SafeArea(
      //   child: Column(
      //     children: [
      //       // SKIP
      //       Align(
      //         alignment: Alignment.topRight,
      //         child: TextButton(
      //           onPressed: skip,
      //           child: Text(
      //             "Skip",
      //             style: AppText.span.copyWith(color: AppColors.grey),
      //           ),
      //         ),
      //       ),

      //       // PAGE VIEW
      //       Expanded(
      //         child: PageView.builder(
      //           controller: controller,
      //           itemCount: pages.length,
      //           onPageChanged: (index) {
      //             setState(() => currentIndex = index);
      //           },
      //           itemBuilder: (context, index) {
      //             final page = pages[index];

      //             return Stack(
      //               children: [
      //                 // ===== BACKGROUND FULL =====
      //                 Positioned.fill(
      //                   child: Image.asset(
      //                     "assets/images/bg_white.png",
      //                     fit: BoxFit.cover,
      //                   ),
      //                 ),

      //                 // ===== CONTENT =====
      //                 SafeArea(
      //                   child: Padding(
      //                     padding: const EdgeInsets.symmetric(horizontal: 24),
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       children: [
      //                         Image.asset(page["image"]!, height: 250),

      //                         const SizedBox(height: 30),

      //                         Text(
      //                           page["title"]!,
      //                           textAlign: TextAlign.center,
      //                           style: AppText.h2.copyWith(color: AppColors.yellow),
      //                         ),

      //                         const SizedBox(height: 10),

      //                         Text(
      //                           page["desc"]!,
      //                           textAlign: TextAlign.center,
      //                           style: AppText.span.copyWith(
      //                             color: Colors.black,
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             );
      //           },
      //         ),
      //       ),

      //       // DOT INDICATOR
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: List.generate(pages.length, (index) {
      //           return Container(
      //             margin: const EdgeInsets.symmetric(horizontal: 4),
      //             width: currentIndex == index ? 10 : 8,
      //             height: currentIndex == index ? 10 : 8,
      //             decoration: BoxDecoration(
      //               color: currentIndex == index
      //                   ? AppColors.yellow
      //                   : Colors.grey.shade400,
      //               shape: BoxShape.circle,
      //             ),
      //           );
      //         }),
      //       ),

      //       const SizedBox(height: 30),

      //       // NEXT BUTTON
      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 24),
      //         child: SizedBox(
      //           width: double.infinity,
      //           child: ElevatedButton(
      //             style: AppButton.tertiary.copyWith(
      //               padding: WidgetStateProperty.all(
      //                 const EdgeInsets.symmetric(vertical: 16),
      //               ),
      //             ),
      //             onPressed: nextPage,
      //             child: Text(
      //               currentIndex == pages.length - 1 ? "Start" : "Next",
      //               style: AppText.span.copyWith(color: Colors.white),
      //             ),
      //           ),
      //         ),
      //       ),

      //       const SizedBox(height: 10),
      //     ],
      //   ),
      // ),
    );
  }
}
