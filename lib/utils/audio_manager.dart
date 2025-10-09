import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioPlayer _bgPlayer = AudioPlayer(); // background only
  static bool _isPlayingBg = false;

  /// 🎵 Start or restart looping background music
  static Future<void> playBackgroundMusic() async {
    try {
      await _bgPlayer.stop();
      await _bgPlayer.setReleaseMode(ReleaseMode.loop);
      await _bgPlayer.setVolume(0.5);
      await _bgPlayer.play(
        AssetSource('audio/bg_music.mp3'),
      );
      _isPlayingBg = true;
    } catch (e) {
      print('⚠️ Error playing background music: $e');
    }
  }

  /// ⏹ Stop background music completely
  static Future<void> stopBackgroundMusic() async {
    try {
      await _bgPlayer.stop();
      _isPlayingBg = false;
    } catch (e) {
      print('⚠️ Error stopping background music: $e');
    }
  }

  /// ✅ Play correct sound without stopping background
  static Future<void> playCorrect() async {
    try {
      final player = AudioPlayer();
      await player.setReleaseMode(ReleaseMode.stop);
      await player.setVolume(1.0);
      await player.play(AssetSource('audio/correct.mp3'));
      // Let the player auto-dispose after a short delay
      Future.delayed(const Duration(seconds: 2), () => player.dispose());
    } catch (e) {
      print('⚠️ Error playing correct sound: $e');
    }
  }

  /// ❌ Play wrong sound without stopping background
  static Future<void> playWrong() async {
    try {
      final player = AudioPlayer();
      await player.setReleaseMode(ReleaseMode.stop);
      await player.setVolume(1.0);
      await player.play(AssetSource('audio/wrong.mp3'));
      // Auto dispose after short time
      Future.delayed(const Duration(seconds: 2), () => player.dispose());
    } catch (e) {
      print('⚠️ Error playing wrong sound: $e');
    }
  }
}
