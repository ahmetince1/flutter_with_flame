import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../../core/constants.dart';

class FallingArrows extends Component with HasGameReference {
  final List<Arrow> _arrows = [];
  double _spawnTimer = 0.0;
  final double _spawnInterval = 1.5;
  int _laneIndex = 0;

  @override
  void update(double dt) {
    super.update(dt);

    _spawnTimer += dt;

    if (_spawnTimer >= _spawnInterval) {
      _spawnTimer = 0.0;
      _spawnArrow();
    }

    for (int i = _arrows.length - 1; i >= 0; i--) {
      final arrow = _arrows[i];
      arrow.position.y += GameConstants.backgroundSpeed * dt;

      if (arrow.position.y > game.size.y) {
        arrow.removeFromParent();
        _arrows.removeAt(i);
      }
    }
  }

  void _spawnArrow() {
    final lane = GameConstants.lanePositions[_laneIndex];
    _laneIndex = (_laneIndex + 1) % GameConstants.lanePositions.length;

    final arrow = Arrow(position: Vector2(lane, -50), size: Vector2(40, 40));

    _arrows.add(arrow);
    add(arrow);
  }
}

class Arrow extends RectangleComponent {
  static final Paint _paint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;

  static final Path _path = Path();

  Arrow({required Vector2 position, required Vector2 size}) : super(position: position, size: size);

  @override
  void render(Canvas canvas) {
    _path.reset();
    final centerX = size.x / 2;
    final centerY = size.y / 2;

    _path.moveTo(centerX, size.y - 5);
    _path.lineTo(centerX - 15, centerY - 10);
    _path.lineTo(centerX - 5, centerY - 10);
    _path.lineTo(centerX - 5, 5);
    _path.lineTo(centerX + 5, 5);
    _path.lineTo(centerX + 5, centerY - 10);
    _path.lineTo(centerX + 15, centerY - 10);
    _path.close();

    canvas.drawPath(_path, _paint);
  }
}
