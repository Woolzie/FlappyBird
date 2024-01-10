import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappybird/reusable/custom_button.dart';
import 'package:flappybird/screens/co_op.dart';
import 'package:flappybird/screens/music_control.dart';
import 'package:flappybird/screens/single_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';


class HomePage extends StatefulWidget {
  static String routeName = '/home_page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
bool isPressed = true;

class _HomePageState extends State<HomePage> {

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
   // AudioCache.instance = AudioCache(prefix:'');
  }

  @override
    Widget build(BuildContext context) {

      return Scaffold(
        backgroundColor: Colors.brown[900],
        body: Stack(
          children: [
              Positioned(
                top: 10,
                right: 10,
                child: MusicControlButton(),
              ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 100,
                      child: Animate(
                        effects: [FadeEffect(begin: 0.1,end: 1, duration: 300.ms, delay:200.ms),SlideEffect(duration: 400.ms)],
                        // [FadeEffect(begin: 0.0, duration: 450.ms), SlideEffect( duration: 450.ms, delay: 100.ms),],
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
                      ),
                      Animate(
                        effects: [FadeEffect(begin: 0.1,end: 1, duration: 300.ms, delay:350.ms),SlideEffect(duration: 400.ms)],
                        child: CustomButton(text: "Single Player Mode",
                              onTap: () => singlePlayer(context)
                        ),
                      ),
                      const SizedBox(height: 40),
                      // CustomButton(
                      //     text: "Co-op Mode", onTap: () => coopPlayer(context)),
                      SizedBox(height: 40,),
                      SizedBox(
                        height: 30,
                        child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              FlickerAnimatedText('SCEPTIX 2024',
                                  textStyle:  TextStyle(
                                      color: Colors.amber[400],
                                      fontSize: 20.0,
                                      fontFamily: 'Game',
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

}
