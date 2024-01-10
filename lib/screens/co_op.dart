
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../components2/flappy2.dart';

class Co_Op extends StatefulWidget {
   const Co_Op({super.key});
 static String routeName = '/co_op';

  @override
  State<Co_Op> createState() => _Co_OpState();
}

class _Co_OpState extends State<Co_Op> {
   late final Flappy2 game;

   @override
   void initState() {
     super.initState();
     game = Flappy2();
   }

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: game);
  }
}
