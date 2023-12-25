import 'package:bonfire/bonfire.dart';
import 'package:flame/game.dart';
import 'package:flappybird/componets/background.dart';

import '../componets/ground.dart';

class FlappyBirdGame extends FlameGame{

  @override
  Future <void> onLoad() async {
    addAll([
      Background(),
      Ground()
      ]
    );
  }
}