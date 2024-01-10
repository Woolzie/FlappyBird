import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

class AudioPlayerProvider with ChangeNotifier{
   AudioPlayer _audioPlayer= AudioPlayer();
  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;

  Future <void> initialize()async {
   _audioPlayer.setSource(AssetSource('audio/undertale_dogsong.mp3'));
   _audioPlayer.setReleaseMode(ReleaseMode.loop);
   }

  void togglePlayer() {
    if (_isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.resume();
    }
    _isPlaying = !_isPlaying;
    notifyListeners();
  }
  void pressed(){
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}

