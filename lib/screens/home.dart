import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flame_audio/flame_audio.dart';
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
bool isPressed = true;

class _HomePageState extends State<HomePage> {

  late Icon icon;
  final player = AudioPlayer();

  void singlePlayer(BuildContext context){
    Navigator.pushNamed(context, SinglePlayer.routeName);
  }

  void coopPlayer(BuildContext context){
    Navigator.pushNamed(context, Co_Op.routeName);
  }
  @override
  void initState(){
    super.initState();
   // AudioCache.instance = AudioCache(prefix:'');
    player.setSource(AssetSource('audio/undertale_dogsong.mp3'));
  }

  @override
    Widget build(BuildContext context) {

      return Scaffold(
        backgroundColor: Colors.brown[900],
        body: Stack(
          children: [
              Positioned(
                top: 10,
                left: 10,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown[700],
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                  ),),
                  child:  Icon(isPressed? Icons.music_off: Icons.music_note),
                  onPressed: () {
                    setState(() {
                      isPressed=!isPressed;
                      _toggleMute();
                    });
                  },
                ),
              ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 100,
                      child: Text("Flappy Bird",
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.amber,
                          fontFamily: FontStyle.italic.toString(),
                          shadows: const <Shadow>[
                            Shadow(
                              offset: Offset(10.0, 10.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            Shadow(
                              offset: Offset(10.0, 10.0),
                              blurRadius: 8.0,
                              color: Color.fromARGB(125, 0, 0, 255),
                            ),
                          ],
                            ),
                      ),
                      ),
                      CustomButton(text: "Single Player Mode",
                            onTap: () => singlePlayer(context)
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                          text: "Co-op Mode", onTap: () => coopPlayer(context)),
                      SizedBox(height: 40,),
                      SizedBox(
                        height: 30,
                        child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              FlickerAnimatedText('SCEPTIX 2024',
                                  textStyle: const TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 20.0,
                                      fontFamily: 'Game',
                                    shadows:  <Shadow>[
                                      Shadow(
                                        offset: Offset(10.0, 10.0),
                                        blurRadius: 3.0,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                      Shadow(
                                        offset: Offset(10.0, 10.0),
                                        blurRadius: 8.0,
                                        color: Color.fromARGB(125, 0, 0, 255),
                                      ),
                                    ],
                                  ),

                              )]
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      );
    }

    @override
    void dispose(){
    super.dispose();
    }

  void _toggleMute()  {
    if (isPressed) {
      player.pause();
    } else {
      player.resume(); // Mute
    }
  }
}
