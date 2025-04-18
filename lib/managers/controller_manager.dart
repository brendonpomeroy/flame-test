import 'package:flame/components.dart';
import 'package:flutter/services.dart';

class ControllerManager extends Component with KeyboardHandler {
  int horizontalDirection = 0;
  bool hasJumped = false;

  void updateFromMobile({required int horizontal, required bool jump}) {
    horizontalDirection = horizontal;
    hasJumped = jump;
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    hasJumped = keysPressed.contains(LogicalKeyboardKey.space);

    horizontalDirection = 0;
    horizontalDirection += (keysPressed.contains(LogicalKeyboardKey.keyA) ||
            keysPressed.contains(LogicalKeyboardKey.arrowLeft))
        ? -1
        : 0;
    horizontalDirection += (keysPressed.contains(LogicalKeyboardKey.keyD) ||
            keysPressed.contains(LogicalKeyboardKey.arrowRight))
        ? 1
        : 0;

    return true;
  }
}
