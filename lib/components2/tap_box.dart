import 'package:bonfire/bonfire.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flappybird/game/flappy_bird2.dart';

import '../game/assets.dart';

class TapBox extends SpriteComponent with HasGameRef<FlappyBirdGame2>{

  late bool isLeft;
  late Vector2 dimension;
TapBox({required this.isLeft}){
  width = 80.0;
  height=83.0;
}
  Future<void> onLoad() async{
    final box =  await Flame.images.load(Assets.tap);
    if(isLeft){
      dimension =   Vector2(gameRef.size.y-height, width);
    }
    else{dimension=Vector2(gameRef.size.y-height, gameRef.size.x-width);}
    sprite= Sprite(box, srcPosition: dimension);
  }
}