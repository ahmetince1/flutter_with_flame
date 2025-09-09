import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../../core/constants.dart';

/// Akan turuncu arkaplan component'i - Basit yaklaşım
class FlowingBackground extends Component with HasGameReference {
  double _scrollOffset = 0.0;

  @override
  void update(double dt) {
    super.update(dt);

    // Sürekli scroll offset'i artır
    _scrollOffset += GameConstants.backgroundSpeed * dt;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    // Tüm ekranı kaplayan turuncu arkaplan
    final paint = Paint()..color = Colors.orange;

    // Gerçek oyun boyutunu kullan - tüm ekranı kapla
    final gameSize = game.size;
    canvas.drawRect(Rect.fromLTWH(0, 0, gameSize.x, gameSize.y), paint);

    // Hareket eden pattern için daha koyu turuncu çizgiler
    final patternPaint = Paint()..color = Colors.orange.shade700;

    // Yatay çizgiler çiz - sürekli akan efekt
    for (int i = 0; i < (gameSize.y / 25).ceil() + 5; i++) {
      final y = (i * 25.0 - _scrollOffset) % gameSize.y;
      canvas.drawRect(Rect.fromLTWH(0, y, gameSize.x, 3), patternPaint);
    }

    // Dikey çizgiler de ekleyelim - daha zengin pattern
    final verticalPaint = Paint()..color = Colors.orange.shade600;
    for (int i = 0; i < (gameSize.x / 40).ceil() + 2; i++) {
      final x = (i * 40.0 - _scrollOffset * 0.5) % gameSize.x;
      canvas.drawRect(Rect.fromLTWH(x, 0, 2, gameSize.y), verticalPaint);
    }
  }
}
