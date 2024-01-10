import 'package:flappybird/game/assets.dart';
import 'package:flappybird/game/flappy_bird.dart';
import 'package:flutter/material.dart';


class CustomOverlay extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id='Overlay';

  const CustomOverlay({super.key, required this.game});
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  GestureDetector(
          onTap: (){game.overlays.remove('Overlay');game.resumeEngine();},
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background-day.png'),
                  fit: BoxFit.cover,
                )
            ),
            // why tf is this not working
            child: Container(
                width: 200,height: 200,child: Image.asset('assets/images/message.png')),
      
          ),
        ),
      
      );
  }
}
