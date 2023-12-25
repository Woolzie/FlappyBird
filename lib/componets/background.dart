

import 'dart:ffi';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappybird/game/flappy_bird.dart';

import '../game/assets.dart';


class Background extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Background();



  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.backgroundDay);
    size = gameRef.size;
    sprite =Sprite(background);
  }
    void resize(Size size) {
    super.autoResize;
    }


}