import 'package:flutter/material.dart';

import 'package:bonfire/bonfire.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import '../components2/background2.dart';
import '../components2/bird2.dart';
import '../components2/ground2.dart';
import '../components2/pipe_group2.dart';
import '../componets/config.dart';

class FlappyBirdGame2 extends FlameGame with TapDetector, HasCollisionDetection{
  late Bird2 bird1;
  late Bird2 bird2;
  Timer interval = Timer(Config.pipeInterval, repeat:true);
  bool isHit=false;
  late TextComponent score;

  @override
  Future <void> onLoad() async {
    addAll([
      Background(),
      Ground2(),
      // the colours are same for now
      bird1 = Bird2(x_position: 50, frame: 21),
      bird2= Bird2(x_position: 90, frame: 0),
      score = buildscore()
    ]
    );
    interval.onTick = () => add(PipeGroup2());
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