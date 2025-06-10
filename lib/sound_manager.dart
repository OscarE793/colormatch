import 'package:audioplayers/audioplayers.dart';

class SoundManager {
  static final AudioPlayer _player = AudioPlayer();

  static Future<void> playClick() async {
    await _player.play(AssetSource('sounds/click.mp3'));
  }

  static Future<void> playMatch() async {
    await _player.play(AssetSource('sounds/match.mp3'));
  }
}