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
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: (){game.overlays.remove('Overlay');game.resumeEngine();},
        child: Container(
          height: double.infinity,
          width: double.infinity,
          //color: Theme.of(context).colorScheme.background,
          child: Image.asset('assets/images/message.png'),

        ),
      ),

    );
  }
}
