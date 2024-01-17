import 'package:bonfire/bonfire.dart';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flappybird/componets/config.dart';
import 'package:flappybird/game/flappy_bird.dart';


import '../game/assets.dart';

class Ground extends ParallaxComponent<FlappyBirdGame> with HasGameRef<FlappyBirdGame>{
  Ground();

  @override
  Future<void> onLoad() async{
    final ground = await Flame.images.load(Assets.base);
    parallax= Parallax([
      ParallaxLayer(
        ParallaxImage(ground, fill: LayerFill.none),
      )
    ]);

    add(RectangleHitbox(
      position: Vector2(0,gameRef.size.y-Config.groundHeight),
      size: Vector2(gameRef.size.x,Config.groundHeight)
    ));
  }
  @override
  void update(double dt){
    super.update(dt);
    parallax?.baseVelocity.x =Config.gameSpeed;
  }
}