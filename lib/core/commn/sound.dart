import 'package:audioplayers/audioplayers.dart';

class sound {
  static AudioPlayer player = AudioPlayer();

  static String alarmAudioPath = "sound/ss.mp3";
  static playsound() async {
    await player.play(AssetSource("sound/ss.mp3"));
  }
}
