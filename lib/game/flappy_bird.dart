import 'package:flame/game.dart';
import 'package:flame/timer.dart';
import 'package:flappybird/componets/background.dart';
import 'package:flappybird/componets/pipe_group.dart';

import '../componets/bird.dart';
import '../componets/config.dart';
import '../componets/ground.dart';

class FlappyBirdGame extends FlameGame{
  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat:true);

  @override
  Future <void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird()
      ]
    );
    interval.onTick = () => add(PipeGroup());
  }
  @override
  void update(double dt){
    super.update(dt);
    interval.update(dt);
  }
}