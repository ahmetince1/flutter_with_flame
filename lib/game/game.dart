import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter_with_flame/game/components/player.dart';

import 'scenes/main_scene.dart';

class MyGame extends FlameGame with DragCallbacks {
  Player? _cachedPlayer;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    try {
      add(MainScene());
    } catch (e) {
      print('Oyun yükleme hatası: $e');
    }
  }

  @override
  bool onDragStart(DragStartEvent event) {
    super.onDragStart(event);
    return true;
  }

  @override
  bool onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);

    _cachedPlayer ??= children.whereType<MainScene>().first.children.whereType<Player>().firstOrNull;
    final player = _cachedPlayer;

    if (player != null) {
      final deltaX = event.localDelta.x;
      final currentLane = player.currentLane;

      if (deltaX.abs() > 5) {
        if (deltaX > 0 && currentLane < 2) {
          player.moveToLane(currentLane + 1);
        } else if (deltaX < 0 && currentLane > 0) {
          player.moveToLane(currentLane - 1);
        }
      }
    }

    return true;
  }

  @override
  bool onDragEnd(DragEndEvent event) {
    super.onDragEnd(event);
    return true;
  }
}
