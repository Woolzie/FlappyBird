import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flappybird/game/flappy_bird.dart';

//single player button, opens to a page
class SinglePlayer extends StatefulWidget {
  static String routeName= '/single-player';
  const SinglePlayer({super.key});

  @override
  State<SinglePlayer> createState() => _SinglePlayerState();
}

class _SinglePlayerState extends State<SinglePlayer> {
  late final FlappyBirdGame game;

  @override
  void initState(){
    super.initState();
    game =FlappyBirdGame();
    runApp(GameWidget(game: game));
  }
  @override
  Widget build(BuildContext context) {
    return GameWidget(game: game);
  }
}

