
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flappybird/componets/config.dart';
import 'package:flappybird/game/flappy_bird.dart';

import '../game/assets.dart';


class Background extends ParallaxComponent<FlappyBirdGame>{
  Background();



  @override
  // Future<void> onLoad() async {
  //   final background = await Flame.images.load(Assets.backgroundDay);
  //   size = gameRef.size;
  //   sprite =Sprite(background);
  // }
  //   void resize(Size size) {
  //   super.autoResize;
  //   }
  Future<void> onLoad() async{
    final background = await Flame.images.load(Assets.backgroundDay);
    parallax= Parallax([
      ParallaxLayer(
        ParallaxImage(background),
      )
    ]);

  }
  void update(double dt){
    super.update(dt);
    parallax?.baseVelocity.x =Config.gameSpeed/3;
  }

}