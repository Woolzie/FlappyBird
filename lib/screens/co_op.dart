
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../game/flappy_bird2.dart';

class Co_Op extends StatefulWidget {
   const Co_Op({super.key});
 static String routeName = '/co_op';

  @override
  State<Co_Op> createState() => _Co_OpState();
}

class _Co_OpState extends State<Co_Op> {
   late final FlappyBirdGame2 game2;

   @override
   void initState() {
     super.initState();
     game2 = FlappyBirdGame2();
   }

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: game2);
  }
}
