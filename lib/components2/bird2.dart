import 'package:bonfire/bonfire.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappybird/componets/config.dart';
import 'package:flappybird/game/flappy_bird2.dart';
import '../game/assets.dart';
enum BirdMovement {middle, up, down}
enum BirdColour {red, yellow}

//TODO: make sprite animation of flapping and control the angle of the bird

class Bird2 extends SpriteGroupComponent<BirdMovement> with HasGameRef<FlappyBirdGame2>,
    CollisionCallbacks {
  Bird2({required this.x_position, required this.frame});
  num time=0;
  int score=0;
  double speed =0.0;
  int frame=0;
  double x_position;
  @override
  Future<void> onLoad() async{
    final birdMidFlap = await gameRef.loadSprite(Assets.blueBirdMidFlap);
    final birdUpFlap = await gameRef.loadSprite(Assets.blueBirdUpFlap);
    final birdDownFlap = await gameRef.loadSprite(Assets.blueBirdDownFlap);

    size = Vector2(gameRef.size.y/13, gameRef.size.y/13);
    position = Vector2(x_position, gameRef.size.y/2 - size.y/2);
    current = BirdMovement.middle;
    sprites ={
      BirdMovement.middle: birdMidFlap,
      BirdMovement.up : birdUpFlap,
      BirdMovement.down : birdDownFlap
    };
    add(CircleHitbox());
  }


  void fly(){
    speed -= Config.birdVelocity;
    FlameAudio.play(Assets.fly);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints,
      PositionComponent other,
      ){
    super.onCollisionStart(intersectionPoints, other);
    FlameAudio.play(Assets.hit);
    gameOver();
  }

  void gameOver(){
    gameRef.pauseEngine();
    game.isHit =true;
    speed =0;
  }

  @override
  void update(double dt){
    super.update(dt);
    speed += Config.gravity*dt;
    position.y += speed*dt; // makes it go down?
    if(position.y<0){
      gameOver();
    }
    angle=speed/100;
    frame+=1;
    switch(frame){
      case 10: current =BirdMovement.down; break;
      case 21: current = BirdMovement.middle;break;
      case 32: current = BirdMovement.up;break;
      case 42: current = BirdMovement.middle; frame=0; break;
    }
  }
  void reset(){
    position = Vector2(x_position, gameRef.size.y/2 - size.y/2);
    time =0;
    score =0;
  }
}