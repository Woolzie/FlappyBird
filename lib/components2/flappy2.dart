import 'dart:ui';

import 'package:flappybird/components2/bird2.dart';
import 'package:flappybird/components2/tap_box.dart';
import 'package:flappybird/componets/background.dart';
import 'package:flappybird/game/flappy_bird.dart';

import '../componets/bird.dart';
import '../componets/ground.dart';
import '../componets/pipe_group.dart';

class Flappy2 extends FlappyBirdGame{
  late Bird2 bird1;
  late Bird2 bird2;

  @override
  Future <void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      TapBox(isLeft: true),
      TapBox(isLeft: false),
      bird = Bird(),
      score = buildscore(),
    ]
    );
    interval.onTick = () => add(PipeGroup());
  }
  @override
  void render(Canvas canvas) {
    // Render your game elements here
    super.render(canvas);
  }
  @override
  void onTap(){}

}