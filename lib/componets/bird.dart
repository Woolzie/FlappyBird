import 'package:bonfire/bonfire.dart';
import 'package:flame/components.dart';
import 'package:flappybird/componets/config.dart';
import 'package:flappybird/game/flappy_bird.dart';
import 'package:flutter/animation.dart';

import '../game/assets.dart';
enum BirdMovement {middle, up, down}

//TODO: make sprite animation of flapping and control the angle of the bird

// TODO: fix the bird speed lmao that shits annoying asf, specifically for co -op for a longer gameplay
class Bird extends SpriteGroupComponent<BirdMovement> with HasGameRef<FlappyBirdGame>,
CollisionCallbacks {
  Bird();
  num time=0;
  int score=0;

  @override
  Future<void> onLoad() async{
    final birdMidFlap = await gameRef.loadSprite(Assets.blueBirdMidFlap);
    final birdUpFlap = await gameRef.loadSprite(Assets.blueBirdUpFlap);
    final birdDownFlap = await gameRef.loadSprite(Assets.blueBirdDownFlap);

    size = Vector2(gameRef.size.y/13, gameRef.size.y/13);
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
    time=0.0070;
    add(
      MoveByEffect(
          Vector2(0,Config.gravity),
          EffectController(duration: 2.0, curve: Curves.easeIn),
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
    game.isHit =true;
    gameRef.overlays.add('gameOver');
  }

  @override
  void update(double dt){
    super.update(dt);
    time=time+0.0095;
    position.y += -(Config.gravity *time*time); // makes it go down?
    if(position.y<0){
      gameOver();
    }
  }
  void reset(){
    position = Vector2(50, gameRef.size.y/2 - size.y/2);
    time =0;
    score =0;
  }
}