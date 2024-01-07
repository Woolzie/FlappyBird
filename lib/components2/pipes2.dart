import 'package:bonfire/bonfire.dart';
import 'package:flame/components.dart';
import 'package:flappybird/componets/config.dart';

import '../game/assets.dart';
import '../game/flappy_bird2.dart';

enum PipePosition {top, bottom}

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame2>{

  Pipe({
    required this.height,
    required this.pipePosition,

  });
  @override
  final double height;
  final PipePosition pipePosition;

  @override
  Future<void> onLoad() async{
    final pipe = await Flame.images.load(Assets.pipeGreen);
    final pipeRotated = await Flame.images.load(Assets.pipeGreenRotated);
    size = Vector2(50, height);

    switch(pipePosition){
      case PipePosition.top:
        position.y=0;
        sprite= Sprite(pipeRotated);
        break;
      case PipePosition.bottom:
        position.y=gameRef.size.y-size.y - Config.groundHeight;
        sprite = Sprite(pipe);
        break;
    }
    add(RectangleHitbox());
  }

}