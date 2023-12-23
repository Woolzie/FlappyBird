import 'package:flame/game.dart';
import 'package:flappybird/componets/background.dart';

class FlappyBirdGame extends FlameGame{
  @override
  Future <void> onLoad() async {
    add(Background());
  }
}