import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../core/utils.dart';

/// Hareketli kare component'i
class MovingSquare extends RectangleComponent with HasGameReference {
  late Vector2 velocity;

  MovingSquare({required Vector2 position, required Vector2 size, required Color color}) : super(position: position, size: size, paint: Paint()..color = color);

  @override
  Future<void> onLoad() async {
    super.onLoad();

    try {
      // Daha tutarlı hız hesaplama
      velocity = GameUtils.randomVelocity(game.size.x * GameConstants.velocityMultiplier);
    } catch (e) {
      print('MovingSquare yükleme hatası: $e');
      // Varsayılan hız
      velocity = Vector2(200, 200);
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    try {
      // Pozisyonu güncelle
      position += velocity * dt;

      // Ekran sınırlarını kontrol et
      if (position.x < 0 || position.x > game.size.x - size.x) {
        velocity.x = -velocity.x;
      }
      if (position.y < 0 || position.y > game.size.y - size.y) {
        velocity.y = -velocity.y;
      }

      // Sınırlar içinde tut
      position.x = GameUtils.clamp(position.x, 0, game.size.x - size.x);
      position.y = GameUtils.clamp(position.y, 0, game.size.y - size.y);
    } catch (e) {
      print('MovingSquare update hatası: $e');
    }
  }
}
