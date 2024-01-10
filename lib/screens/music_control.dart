
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/audio_provider.dart';

class MusicControlButton extends StatefulWidget {
  @override
  _MusicControlButtonState createState() => _MusicControlButtonState();
}


class _MusicControlButtonState extends State<MusicControlButton> {




  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioPlayerProvider>(context);
    audioProvider.initialize();
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber[700]
            ),
          onPressed: () {
            audioProvider.togglePlayer();
            //audioProvider.pressed();
            },

      child:  Icon(audioProvider.isPlaying? Icons.music_note: Icons.music_off,color: Colors.white, ));
          }


  @override
  void dispose() {
    super.dispose();
  }
  }
