import 'package:bonfire/bonfire.dart';
import 'package:flame/components.dart';
import 'package:flappybird/componets/config.dart';
import 'flappy2.dart';
import 'package:flappybird/game/flappy_bird.dart';
import '../game/assets.dart';

class TapBox extends SpriteComponent with HasGameRef<Flappy2>{

  late bool isLeft;
  late Vector2 dimension;
  late double widthbox, heightbox;
TapBox({required this.isLeft});

@override
  Future<void> onLoad() async{
    widthbox = gameRef.size.x/8;
    heightbox=Config.groundHeight;
    final box =  await Flame.images.load(Assets.tap);
    position.y= gameRef.size.y-heightbox;
    if(isLeft){
      position.x=0;
    }
    else{position.x=gameRef.size.x-widthbox;}
    sprite= Sprite(box, srcSize: Vector2(widthbox, heightbox));
  }
}