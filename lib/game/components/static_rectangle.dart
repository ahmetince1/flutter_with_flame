import 'package:flame/components.dart';
import 'package:flutter/material.dart';

/// Statik dikdörtgen component'i
class StaticRectangle extends RectangleComponent {
  StaticRectangle({required Vector2 position, required Vector2 size, required Color color}) : super(position: position, size: size, paint: Paint()..color = color);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // Statik component'ler için özel yükleme işlemleri
  }
}
