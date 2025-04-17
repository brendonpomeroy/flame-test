import 'package:shared_preferences/shared_preferences.dart';

class HighscoreManager {
  static const _key = 'highscore';

  int _highscore = 0;

  int get highscore => _highscore;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _highscore = prefs.getInt(_key) ?? 0;
  }

  Future<void> updateIfHigher(int score) async {
    if (score > _highscore) {
      _highscore = score;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_key, _highscore);
    }
  }
}
