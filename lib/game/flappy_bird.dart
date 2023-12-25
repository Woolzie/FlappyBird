import 'package:bonfire/bonfire.dart';
import 'package:flame/game.dart';
import 'package:flappybird/componets/background.dart';

import '../componets/bird.dart';
import '../componets/ground.dart';

class FlappyBirdGame extends FlameGame{
  late Bird bird;

  @override
  Future <void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird()
      ]
    );
  }
}