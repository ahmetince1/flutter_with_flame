import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flame Temel Öğrenme', theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), useMaterial3: true), home: const GamePage());
  }
}

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hafta 1 - Flame Temelleri'), backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Center(child: GameWidget(game: MyGame())),
    );
  }
}

// Ana oyun sınıfımız
class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Kırmızı kare ekle
    add(RectangleComponent(position: Vector2(50, 50), size: Vector2(100, 100), paint: Paint()..color = Colors.red));

    // Mavi dikdörtgen ekle
    add(RectangleComponent(position: Vector2(200, 100), size: Vector2(150, 80), paint: Paint()..color = Colors.blue));

    // Hareketli kare ekle
    add(MovingSquare(position: Vector2(300, 200), size: Vector2(60, 60), color: Colors.orange));
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

    position += velocity * dt;

    if (position.x < 0 || position.x > game.size.x - size.x) {
      velocity.x = -velocity.x;
    }
    if (position.y < 0 || position.y > game.size.y - size.y) {
      velocity.y = -velocity.y;
    }

    position.x = position.x.clamp(0, game.size.x - size.x);
    position.y = position.y.clamp(0, game.size.y - size.y);
  }
}
