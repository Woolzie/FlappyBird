
import 'package:flappybird/game/flappy_bird.dart';
import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  final  FlappyBirdGame game;
  static const String id='gameOver';
   const GameOver({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.transparent,
      body: Container(
          height: double.infinity,
          width: double.infinity,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/gameover.png'),
            const SizedBox(height: 20,),
            Text('Score: ${game.bird.score}', style: TextStyle( fontFamily: 'Game', fontSize: 30),),
            const SizedBox(height: 100),
            ElevatedButton(onPressed: (){game.bird.reset();game.overlays.remove('gameOver');game.resumeEngine();},
            style: ButtonStyle(
              backgroundColor:  MaterialStateProperty.all<Color>(Colors.orangeAccent
            ),),
              child: const Text(
              'New Game',
              style: TextStyle(fontFamily: 'Game', color: Colors.white70),
            ),
            ),
            //TODO:  ADD THE GESTURE DETECTOR IN A SIZED BOX
          ],
        ),
        ),

    );
  }
}
