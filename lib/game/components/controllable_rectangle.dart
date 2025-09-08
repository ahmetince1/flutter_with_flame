import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

/// Sürüklenebilir dikdörtgen component'i
class ControllableRectangle extends RectangleComponent with DragCallbacks, HasGameReference {
  ControllableRectangle({required Vector2 position, required Vector2 size, required Color color}) : super(position: position, size: size, paint: Paint()..color = color);

  @override
  Future<void> onLoad() async {
    super.onLoad();
  }

  @override
  bool onDragStart(DragStartEvent event) {
    super.onDragStart(event);
    print('Sürükleme başladı: ${event.localPosition}');
    return true;
  }

  @override
  bool onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);

    // Delta kullanarak pozisyonu güncelle
    position += event.localDelta;

    // Ekran sınırları içinde tut
    position.x = position.x.clamp(0, game.size.x - size.x);
    position.y = position.y.clamp(0, game.size.y - size.y);

    return true;
  }

  @override
  bool onDragEnd(DragEndEvent event) {
    super.onDragEnd(event);
    print('Sürükleme bitti: $position');
    return true;
  }
}
