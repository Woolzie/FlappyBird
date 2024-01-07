import 'package:bonfire/bonfire.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flappybird/game/flappy_bird2.dart';

class TapBox extends PositionComponent with TapDetector, HasGameRef<FlappyBirdGame2>{

}