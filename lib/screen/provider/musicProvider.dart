import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';

class MusicProvider extends ChangeNotifier
{
  bool isPlay = false;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration endDuration = Duration(seconds: 0);

}