import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../../core/constants.dart';

class SimpleScrollingBackground extends RectangleComponent with HasGameReference {
  late List<RectangleComponent> _tiles;
  double _scrollOffset = 0.0;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    position = Vector2.zero();
    size = game.size;
    paint = Paint()..color = Colors.orange;

    _tiles = [];
    for (int i = 0; i < 20; i++) {
      final tile = RectangleComponent(position: Vector2(0, i * 40.0), size: Vector2(game.size.x, 2), paint: Paint()..color = Colors.orange.shade800);
      _tiles.add(tile);
      add(tile);
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    _scrollOffset += GameConstants.backgroundSpeed * dt;

    for (final tile in _tiles) {
      tile.position.y += GameConstants.backgroundSpeed * dt;

      if (tile.position.y > game.size.y) {
        tile.position.y = -40;
      }
    }
  }
}
