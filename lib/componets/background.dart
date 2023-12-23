

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flappybird/game/flappy_bird.dart';

import '../game/assets.dart';


class Background extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Background();

  late Parallax parallaxComponent;

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.backgroundDay);
    sprite = Sprite(background,
        // srcPosition: Vector2(800.0,350.0),
        //   srcSize: Vector2(1550.0,550.0)
        srcSize: null,
        srcPosition: Vector2(800.0, 450.0)
    );
    //double maxSide = min(size.x, size.y);

    // final cameraComponent = CameraComponent.withFixedResolution(
    //   world: background,
    //   width: maxSide,
    //   height: maxSide,
    //
    // );

  }
}