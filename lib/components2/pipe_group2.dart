import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappybird/components2/pipes2.dart';
import 'package:flappybird/componets/config.dart';
import 'package:flappybird/game/assets.dart';

import '../game/flappy_bird2.dart';

class PipeGroup2 extends PositionComponent with HasGameRef<FlappyBirdGame2>{
  PipeGroup2();

  final _random = Random();

  @override
  Future<void> onLoad() async{
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 7* gameRef.bird1.size.y/2 ;//
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
    gameRef.bird2.score += 1;
    FlameAudio.play(Assets.point);
  }

}