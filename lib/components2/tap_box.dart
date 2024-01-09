import 'package:bonfire/bonfire.dart';
import 'package:flame/components.dart';
import 'package:flappybird/game/flappy_bird2.dart';

class TapBox extends SpriteComponent with HasGameRef<FlappyBirdGame2>{

  late bool isLeft;
TapBox({required this.isLeft}){
  width = 50;
  height=50;
}
}