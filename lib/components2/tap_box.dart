import 'package:bonfire/bonfire.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flappybird/componets/config.dart';
import 'flappy2.dart';
import '../game/assets.dart';

class TapBox extends SpriteComponent with HasGameRef<Flappy2>, TapCallbacks{

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
    size =  Vector2(widthbox, heightbox);
    sprite= Sprite(box);
  }

    @override
    void onTapDown(TapDownEvent event){
      if(isLeft){
        gameRef.bird2.fly();

      }
      else{
        gameRef.bird1.fly();
      }
         }
    }