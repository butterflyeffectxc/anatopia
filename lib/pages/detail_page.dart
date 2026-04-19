import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/body_part.dart';
import '../theme/style.dart';

class DetailPage extends StatefulWidget {
  final BodyPart bodyPart;
  const DetailPage({super.key, required this.bodyPart});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final AudioPlayer player = AudioPlayer();
  int currentIndex = 0;

  SubBodyPart get currentPart => widget.bodyPart.details[currentIndex];

  Future<void> playSound() async {
    try {
      await player.stop();
      await player.setReleaseMode(ReleaseMode.stop);

      print("TRY PLAY: ${currentPart.audio}");
      await player.play(AssetSource(currentPart.audio));

      print("PLAY OK");
    } catch (e) {
      print("PLAY ERROR: $e");
    }
  }

  void nextPart() {
    if (currentIndex < widget.bodyPart.details.length - 1) {
      setState(() => currentIndex++);
      playSound();
    }
  }

  void prevPart() {
    if (currentIndex > 0) {
      setState(() => currentIndex--);
      playSound();
    }
  }

  @override
  void initState() {
    super.initState();
    player.setReleaseMode(ReleaseMode.stop);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final part = currentPart;
    final isFirst = currentIndex == 0;
    final isLast = currentIndex == widget.bodyPart.details.length - 1;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text("Home", style: AppText.h5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // PROGRESS
            Text(
              "${currentIndex + 1} / ${widget.bodyPart.details.length}",
              style: AppText.span.copyWith(color: AppColors.orange),
            ),

            const SizedBox(height: 10),

            // TITLE
            Text.rich(
              TextSpan(
                text: "Meet our, ",
                style: AppText.h4.copyWith(color: Colors.black),
                children: [
                  TextSpan(
                    text: part.nameEnglish,
                    style: AppText.h4.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // IMAGE / GIF
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(part.image, fit: BoxFit.contain),
              ),
            ),

            const SizedBox(height: 20),

            // DESCRIPTION
            Column(
              children: [
                Text(
                  "This is your ${part.nameEnglish}",
                  style: AppText.h5.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  part.description,
                  textAlign: TextAlign.center,
                  style: AppText.span.copyWith(color: AppColors.grey),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // PREV
                if (!isFirst)
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: prevPart,
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                  ),

                if (!isFirst) const SizedBox(width: 12),

                // PLAY
                ElevatedButton.icon(
                  onPressed: playSound,
                  icon: const Icon(Icons.play_arrow),
                  label: Text(
                    "Play Now",
                    style: AppText.span.copyWith(color: Colors.white),
                  ),
                  style: AppButton.primary.copyWith(
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    ),
                  ),
                ),

                if (!isLast) const SizedBox(width: 12),

                // NEXT
                if (!isLast)
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: nextPart,
                      icon: const Icon(Icons.arrow_forward),
                      color: Colors.white,
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
