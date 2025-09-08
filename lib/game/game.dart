import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../core/constants.dart';
import 'scenes/main_scene.dart';

/// Ana oyun sınıfı
class MyGame extends FlameGame with TapCallbacks {
  @override
  Future<void> onLoad() async {
    super.onLoad();

    try {
      // Ana sahneyi ekle
      add(MainScene());
    } catch (e) {
      print('Oyun yükleme hatası: $e');
    }
  }

  @override
  bool onTapDown(TapDownEvent event) {
    try {
      // Dokunulan yere yeşil daire ekle
      add(CircleComponent(position: event.localPosition, radius: GameConstants.circleRadius, paint: Paint()..color = GameConstants.tapCircleColor));
      print('Dokunma algılandı: ${event.localPosition}');
      return true; // Olayın işlendiğini belirtir
    } catch (e) {
      print('Tap handling hatası: $e');
      return false;
    }
  }

  @override
  bool onTapUp(TapUpEvent event) {
    // Dokunma kaldırıldığında yapılacak işlemler
    print('Dokunma bitti: ${event.localPosition}');
    return true;
  }

  @override
  bool onTapCancel(TapCancelEvent event) {
    // Dokunma iptal edildiğinde yapılacak işlemler
    print('Dokunma iptal edildi');
    return true;
  }
}
