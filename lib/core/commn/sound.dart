import 'package:audioplayers/audioplayers.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';

class sound {
  static AudioPlayer player = AudioPlayer();

  static String alarmAudioPath = "sound/ss.mp3";
  static playsound() async {
    if (cashhelper.getdata(key: "sound"))
      await player.play(AssetSource("sound/ss.mp3"));
  }
}
