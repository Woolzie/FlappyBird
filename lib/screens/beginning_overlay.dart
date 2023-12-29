import 'package:flappybird/game/flappy_bird.dart';
import 'package:flutter/material.dart';


class CustomOverlay extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id='Overlay';

  const CustomOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    return Scaffold(
      body: GestureDetector(
        onTap: (){game.overlays.remove('Overlay');game.resumeEngine();},
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(image: DecorationImage(image:Image.asset('assets/images/message.png').image)),
        ),
      ),

    );
  }
}
