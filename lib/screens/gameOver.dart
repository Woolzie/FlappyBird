
import 'package:flappybird/game/flappy_bird.dart';
import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  final  FlappyBirdGame game;
  static const String id='gameOver';
   const GameOver({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: GestureDetector(
        onTap: (){game.bird.reset();game.overlays.remove('gameOver');game.resumeEngine();},
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(image: DecorationImage(image:Image.asset('assets/images/gameover.png').image)),
        ),
      ),

    );
  }
}
