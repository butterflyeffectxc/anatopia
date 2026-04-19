import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/body_part.dart';

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
  // Future<void> playSound() async {
  //   await player.stop();
  //   await player.setVolume(1.0);
  //   await player.setReleaseMode(ReleaseMode.stop);

  //   await player.play(AssetSource(currentPart.audio));
  // }

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
    player.onPlayerStateChanged.listen((state) {
      print("STATE: $state");
    });

    player.onDurationChanged.listen((d) {
      print("DURATION: $d");
    });

    player.onPositionChanged.listen((p) {
      print("POSITION: $p");
    });
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
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // PROGRESS
            Text(
              "${currentIndex + 1} / ${widget.bodyPart.details.length}",
              style: TextStyle(
                color: Colors.orange.shade400,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            // TITLE
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 28, color: Colors.black),
                children: [
                  const TextSpan(text: "Meet our, "),
                  TextSpan(
                    text: part.nameEnglish,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // gifnya cuyyy
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  color: Colors.transparent,
                  child: Image.asset(part.image, fit: BoxFit.contain),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // DESCRIPTION
            Column(
              children: [
                Text(
                  "This is your ${part.nameEnglish}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  part.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 20),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // button dinamis
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // PREV
                  if (!isFirst)
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFC107),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: prevPart,
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                      ),
                    ),

                  if (!isFirst) const SizedBox(width: 12),

                  // PLAY (TENGAH)
                  ElevatedButton.icon(
                    onPressed: () async {
                      await playSound();
                    },
                    icon: const Icon(Icons.play_arrow),
                    label: const Text(
                      "Play Now",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC107),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),

                  if (!isLast) const SizedBox(width: 12),

                  // NEXT
                  if (!isLast)
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFC107),
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
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
