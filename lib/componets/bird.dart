import 'package:bonfire/bonfire.dart';
import 'package:flame/components.dart';
import 'package:flappybird/game/bird_movemnet.dart';
import 'package:flappybird/game/flappy_bird.dart';

import '../game/assets.dart';

class Bird extends SpriteGroupComponent<BirdMovement> with HasGameRef<FlappyBirdGame>{
  Bird();

  @override
  Future<void> onLoad() async{
    final birdMidFlap = await gameRef.loadSprite(Assets.blueBirdMidFlap);
    final birdUpFlap = await gameRef.loadSprite(Assets.blueBirdUpFlap);
    final birdDownFlap = await gameRef.loadSprite(Assets.blueBirdDownFlap);

    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y/2 - size.y/2);
    current = BirdMovement.middle;
    sprites ={
      BirdMovement.middle: birdMidFlap,
      BirdMovement.up : birdUpFlap,
      BirdMovement.down : birdDownFlap
    };
  }

}