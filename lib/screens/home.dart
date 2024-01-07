import 'package:audioplayers/audioplayers.dart';
import 'package:flappybird/reusable/custom_button.dart';
import 'package:flappybird/screens/co_op.dart';
import 'package:flappybird/screens/single_player.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  static String routeName = '/home_page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
bool isPressed = false;

class _HomePageState extends State<HomePage> {
  final player = AudioPlayer();
  late Icon icon;

  void singlePlayer(BuildContext context){
    Navigator.pushNamed(context, SinglePlayer.routeName);
  }

  void coopPlayer(BuildContext context){
    Navigator.pushNamed(context, Co_Op.routeName);
  }
  @override
  void initState(){
    super.initState();
    player.play(DeviceFileSource('assets/audio/undertale_dogsong.mp3'));
    icon =isPressed? Icon(Icons.music_off, color: Colors.grey): Icon(Icons.music_note, color: Colors.white,);
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.brown[900],
        body: Stack(
          children: [
              Positioned(
                top: 0,
                left: 0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown[700],
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                  ),),
                  child: icon,
                  onPressed: () {
                    isPressed = !isPressed;
                    _toggleMute();
                  },
                ),
              ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(text: "Single Player Mode",
                            onTap: () => singlePlayer(context)
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                          text: "Co-op Mode", onTap: () => coopPlayer(context)),
                    ],
                  ),
                ],
              ),
      );
    }

  void _toggleMute()  {
    if (isPressed) {
       player.setVolume(0.0); // Unmute
    } else {
       player.setVolume(1.0); // Mute
    }


  }

}
