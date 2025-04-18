import 'package:flutter/material.dart';

import '../ember_quest.dart';

class GameOver extends StatefulWidget {
  // Reference to parent game.
  final EmberQuestGame game;
  const GameOver({super.key, required this.game});

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  late final int highscore;
  late final bool newHighscore;

  @override
  void initState() {
    super.initState();
    if (widget.game.starsCollected > widget.game.highscoreManager.highscore) {
      newHighscore = true;
      widget.game.highscoreManager.updateIfHigher(widget.game.starsCollected);
    } else {
      newHighscore = false;
    }

    highscore = widget.game.highscoreManager.highscore;
  }

  @override
  Widget build(BuildContext context) {
    const blackTextColor = Color.fromRGBO(0, 0, 0, 1.0);
    const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: blackTextColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Game Over',
                    style: TextStyle(
                      color: whiteTextColor,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text("High Score: ${widget.game.highscoreManager.highscore}",
                      style: const TextStyle(
                        color: whiteTextColor,
                        fontSize: 14,
                      )),
                  const SizedBox(height: 10),
                  Text("Your Score: ${widget.game.starsCollected}",
                      style: const TextStyle(
                        color: whiteTextColor,
                        fontSize: 20,
                      )),
                  newHighscore
                      ? const Text(
                          "New High Score!",
                          style: TextStyle(
                            color: Colors.lightGreenAccent,
                            fontSize: 20,
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    height: 75,
                    child: ElevatedButton(
                      onPressed: () {
                        widget.game.reset();
                        widget.game.overlays.remove('GameOver');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: whiteTextColor,
                      ),
                      child: const Text(
                        'Play Again',
                        style: TextStyle(
                          fontSize: 28.0,
                          color: blackTextColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
