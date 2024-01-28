import 'dart:ui';

import 'package:flappybird/components2/bird2.dart';
import 'package:flappybird/components2/pipegroups2.dart';
import 'package:flappybird/components2/tap_box.dart';
import 'package:flappybird/componets/background.dart';
import 'package:flappybird/componets/bird.dart';
import 'package:flappybird/game/flappy_bird.dart';

import '../componets/ground.dart';


class Flappy2 extends FlappyBirdGame{
  late TapBox box1= TapBox(isLeft: true);
  late TapBox box2=TapBox(isLeft: false);
   Bird2 bird2 = Bird2(first: true);
   Bird2 bird1 = Bird2(first: false);
  Bird bird= Bird();

  @override
  Future <void> onLoad() async {

    addAll([
      Background(),
      Ground(),
      box1,
      box2,
      bird1,
      bird2,
      score = buildscore(),
    ]
    );
    interval.onTick = () => add(PipeGroup2());
  }
  @override
  void render(Canvas canvas) {
    // Render your game elements here
    super.render(canvas);
  }
  @override
  void onTap(){}

}