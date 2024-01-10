import 'package:flame/game.dart';
import 'package:flappybird/screens/gameOver.dart';
import 'package:flappybird/screens/home.dart';
import 'package:flappybird/screens/music_control.dart';
import 'package:flutter/material.dart';
import 'package:flappybird/game/flappy_bird.dart';
import 'beginning_overlay.dart';

//single player button, opens to a page
class SinglePlayer extends StatefulWidget{
  static String routeName= '/single-player';
   SinglePlayer({super.key});

  @override
  State<SinglePlayer> createState() => _SinglePlayerState();
}

class _SinglePlayerState extends State<SinglePlayer> {
  late final FlappyBirdGame game;

  @override
  void initState() {
    super.initState();
    game = FlappyBirdGame();
    // runApp(GameWidget(game: game)); this code was the problem lol
  }

  void homePage(BuildContext context){
    Navigator.pushNamed(context, HomePage.routeName);
  }
  @override
  Widget build(BuildContext context) {
    game.pauseWhenBackgrounded;
    game.pauseEngine();

    return Stack(
      children: [

        GameWidget(game: game,
        initialActiveOverlays: const [CustomOverlay.id],
        // remove CustomOverlay, replace it with a
        overlayBuilderMap: {
          'Overlay': (context, _) => CustomOverlay(game: game),
          'gameOver': (context, _) => GameOver(game: game)
        },
      ),
        Positioned(
          top: 10,
          right: 10,
          child: MusicControlButton(),
        ),
        Positioned(
            bottom: 40,
            right: 10,
            child: ElevatedButton(
          onPressed:()=> homePage(context),
              style:  ElevatedButton.styleFrom(
    backgroundColor: Colors.amber[700]
    ),
              child: Icon(Icons.arrow_back_ios),
        ))
      ]
    );
  }
}
