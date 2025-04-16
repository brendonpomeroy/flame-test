import 'package:flutter/material.dart';

import '../ember_quest.dart';

class MobileController extends StatelessWidget {
  // Reference to parent game.
  final EmberQuestGame game;

  const MobileController({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    int horizontal = 0;
    bool jump = false;

    void updateInput() {
      game.controllerManager.updateFromMobile(horizontal: horizontal, jump: jump);
    }

    return Stack(
      children: [
        // Left button
        Positioned(
          left: 20,
          bottom: 50,
          child: GestureDetector(
            onTapDown: (_) {
              horizontal = -1;
              updateInput();
            },
            onTapUp: (_) {
              horizontal = 0;
              updateInput();
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(100),
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(Icons.arrow_left_rounded, size: 50, color: Colors.white,),
            ),
          ),
        ),

        // Right button
        Positioned(
          left: 100,
          bottom: 50,
          child: GestureDetector(
            onTapDown: (_) {
              horizontal = 1;
              updateInput();
            },
            onTapUp: (_) {
              horizontal = 0;
              updateInput();
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(100),
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(Icons.arrow_right_rounded, size: 50, color: Colors.white,),
            ),
          ),
        ),

        // Jump button
        Positioned(
          right: 20,
          bottom: 50,
          child: GestureDetector(
            onTapDown: (_) {
              jump = true;
              updateInput();
            },
            onTapUp: (_) {
              jump = false;
              updateInput();
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(140),
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(30),
              ),
              width: 60,
              height: 60,
              child: const Icon(Icons.arrow_drop_up_rounded, size: 50, color: Colors.white, ),
            ),
          ),
        ),
      ],
    );
  }
}