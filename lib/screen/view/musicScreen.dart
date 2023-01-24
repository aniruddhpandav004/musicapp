import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  bool isPlay = false;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration endDuration = Duration(seconds: 0);

  @override
  void initState() {
    super.initState();
    loadAudio();
  }

  void loadAudio() async {
    await assetsAudioPlayer.open(Audio("assets/audio/keshri.mp3"),
        autoStart: false);

    assetsAudioPlayer.current.listen(
      (event) {
        setState(
          () {
            endDuration = event!.audio.duration;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Music Player",
            style: TextStyle(color: Colors.black),
          ),
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Color(0xff83d39d),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(
                    () {
                      isPlay = !isPlay;
                    },
                  );
                  if (isPlay) {
                    assetsAudioPlayer.play();
                  } else {
                    assetsAudioPlayer.pause();
                  }
                },
                icon: Icon(isPlay
                    ? Icons.pause_circle_filled_outlined
                    : Icons.play_circle,color: Color(0xff83d39d),size: 40,),
              ),
              assetsAudioPlayer.builderCurrentPosition(
                builder: (context, duration) {
                  return Column(
                    children: [
                      Slider(
                        value: duration.inSeconds.toDouble(),
                        onChanged: (value) {
                          assetsAudioPlayer.seek(
                            Duration(
                              seconds: value.toInt(),
                            ),
                          );
                        },
                        max: endDuration.inSeconds.toDouble(),
                        activeColor: Color(0xff83d39d),
                        autofocus: true,
                        inactiveColor: Colors.greenAccent.shade100,
                      ),
                      Text("$duration / $endDuration"),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
