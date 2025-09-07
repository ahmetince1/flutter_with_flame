import 'package:flame/components.dart';
import 'package:flutter/material.dart';

// Ana oyun sahnesi
class GameScene extends Component {
  late RectangleComponent redSquare;
  late RectangleComponent blueRectangle;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Kırmızı kare oluştur
    redSquare = RectangleComponent(position: Vector2(50, 50), size: Vector2(100, 100), paint: Paint()..color = Colors.red);

    // Mavi dikdörtgen oluştur
    blueRectangle = RectangleComponent(position: Vector2(200, 100), size: Vector2(150, 80), paint: Paint()..color = Colors.blue);

    // Component'leri sahneye ekle
    add(redSquare);
    add(blueRectangle);
  }
}

// Hareketli component sınıfı
class MovingSquare extends RectangleComponent with HasGameReference {
  late Vector2 velocity;

  MovingSquare({required Vector2 position, required Vector2 size, required Color color}) : super(position: position, size: size, paint: Paint()..color = color);

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Rastgele hız belirle
    velocity = Vector2((game.size.x * 0.1) * (0.5 - (DateTime.now().millisecond % 100) / 100), (game.size.y * 0.1) * (0.5 - (DateTime.now().millisecond % 100) / 100));
  }

  @override
  void update(double dt) {
    super.update(dt);

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
    position.x = position.x.clamp(0, game.size.x - size.x);
    position.y = position.y.clamp(0, game.size.y - size.y);
  }
}
