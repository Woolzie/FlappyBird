import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappybird/components2/flappy2.dart';
import 'package:flappybird/components2/pipe_position2.dart';
import 'package:flappybird/componets/config.dart';
import 'package:flappybird/game/assets.dart';

// I hope i gg one day so i can fix this garbage
class PipeGroup2 extends PositionComponent with HasGameRef<Flappy2>{
  PipeGroup2();

  final _random = Random();

  @override
  Future<void> onLoad() async{
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 7* gameRef.bird2.size.y/2 ;//
    final centerY = spacing + _random.nextDouble()*(heightMinusGround-spacing);
    addAll([
      Pipe2(pipePosition: PipePosition.top, height:centerY-spacing),
      Pipe2(pipePosition: PipePosition.bottom, height:heightMinusGround- (centerY))
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
  // scoring system not needed ig
  void updateScore(){
    gameRef.bird2.score += 1;
    FlameAudio.play(Assets.point);
  }

}