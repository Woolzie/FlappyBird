import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappybird/componets/config.dart';
import 'package:flappybird/componets/pipe_position.dart';
import 'package:flappybird/game/assets.dart';
import 'package:flappybird/game/flappy_bird.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame>{
  PipeGroup();

  final _random = Random();

  @override
  Future<void> onLoad() async{
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 7* gameRef.bird.size.y/2 ;//
    final centerY = spacing + _random.nextDouble()*(heightMinusGround-spacing);
    addAll([
      Pipe(pipePosition: PipePosition.top, height:centerY-spacing),
      Pipe(pipePosition: PipePosition.bottom, height:heightMinusGround- (centerY))
    ]);
  }

  @override
  void update(double dt){
    super.update(dt);
    position.x -= Config.gameSpeed * dt;
    if (position.x <-40){
      removeFromParent();
      updateScore();
    }
    if(gameRef.isHit){
      removeFromParent();
      gameRef.isHit= false;
    }
  }

  // make height dynamic later
  void updateScore(){
    gameRef.bird.score += 1;
    FlameAudio.play(Assets.point);
  }

}