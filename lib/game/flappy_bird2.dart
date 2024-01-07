import 'package:flutter/material.dart';

import 'package:bonfire/bonfire.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappybird/componets/background.dart';
import 'package:flappybird/componets/pipe_group.dart';

import '../componets/bird.dart';
import '../componets/config.dart';
import '../componets/ground.dart';

class FlappyBirdGame2 extends FlameGame with TapDetector, HasCollisionDetection{
  late Bird bird1;
  late Bird bird2;
  Timer interval = Timer(Config.pipeInterval, repeat:true);
  bool isHit=false;
  late TextComponent score;

  @override
  Future <void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      // the colours are same for now
      bird1 = Bird(x_position: 50),
      bird2= Bird(x_position: 90),
      score = buildscore()
    ]
    );
    interval.onTick = () => add(PipeGroup());
  }


  @override
  void onTap(){
    super.onTap();
    bird2.fly();
  }

  TextComponent buildscore(){
    return TextComponent(
        text: 'Score: 0',
        position: Vector2(size.x/2,size.y/2*0.2),
        anchor: Anchor.center,
        textRenderer: TextPaint(
          style: const TextStyle(fontSize: 40, fontFamily: 'Game',fontWeight: FontWeight.bold, color: Colors.white70, ),
        )
    );
  }
  @override
  void update(double dt){
    super.update(dt);
    interval.update(dt);
    score.text ='Score: ${bird2.score}';
  }
}