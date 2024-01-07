
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flappybird/componets/config.dart';

import '../game/assets.dart';
import '../game/flappy_bird2.dart';


class Background extends ParallaxComponent<FlappyBirdGame2>{
  Background();



  @override

  Future<void> onLoad() async{
    final background = await Flame.images.load(Assets.backgroundDay);
    parallax= Parallax([
      ParallaxLayer(
        ParallaxImage(background),
      )
    ]);

  }
  @override
  void update(double dt){
    super.update(dt);
    parallax?.baseVelocity.x =Config.gameSpeed/3;
  }

}