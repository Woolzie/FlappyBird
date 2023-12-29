import 'dart:math';
import 'package:flame/components.dart';
import 'package:flappybird/componets/config.dart';
import 'package:flappybird/componets/pipe_position.dart';
import 'package:flappybird/game/flappy_bird.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame>{
  PipeGroup();

  final _random = Random();

  @override
  Future<void> onLoad() async{
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = gameRef.size.y/10 + _random.nextDouble()*(heightMinusGround/2);
    final centerY = spacing + _random.nextDouble()*(heightMinusGround-spacing);
    addAll([
      Pipe(pipePosition: PipePosition.top, height:spacing-centerY/2),
      Pipe(pipePosition: PipePosition.bottom, height:heightMinusGround- (centerY+spacing/2))
    ]);
  }

  @override
  void update(double dt){
    super.update(dt);
    position.x -= Config.gameSpeed * dt;
    if (position.x <-40){
      removeFromParent();
    }
  }
  // make height dynamic later

}