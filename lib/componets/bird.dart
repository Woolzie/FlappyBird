import 'package:bonfire/bonfire.dart';
import 'package:flame/components.dart';
import 'package:flappybird/componets/config.dart';
import 'package:flappybird/game/flappy_bird.dart';
import 'package:flutter/animation.dart';

import '../game/assets.dart';

enum BirdMovement {middle, up, down}

class Bird extends SpriteGroupComponent<BirdMovement> with HasGameRef<FlappyBirdGame>,
CollisionCallbacks {
  Bird();

  @override
  Future<void> onLoad() async{
    final birdMidFlap = await gameRef.loadSprite(Assets.blueBirdMidFlap);
    final birdUpFlap = await gameRef.loadSprite(Assets.blueBirdUpFlap);
    final birdDownFlap = await gameRef.loadSprite(Assets.blueBirdDownFlap);

    size = Vector2(35, 30);
    position = Vector2(50, gameRef.size.y/2 - size.y/2);
    current = BirdMovement.middle;
    sprites ={
      BirdMovement.middle: birdMidFlap,
      BirdMovement.up : birdUpFlap,
      BirdMovement.down : birdDownFlap
    };
    add(CircleHitbox());
  }

  void fly(){
    add(
      MoveByEffect(
          Vector2(0,Config.gravity),
          EffectController(duration: 0.2, curve: Curves.decelerate),
          onComplete: () => current = BirdMovement.down,
      )
    );
    current = BirdMovement.up;
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints,
      PositionComponent other,
      ){
    super.onCollisionStart(intersectionPoints, other);
  gameOver();
  }

  void gameOver(){
    gameRef.pauseEngine();
  }

  @override
  void update(double dt){
    super.update(dt);
    position.y += Config.birdVelocity * dt;

  }
}