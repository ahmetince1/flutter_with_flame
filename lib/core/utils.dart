import 'dart:math';

import 'package:flame/components.dart';

/// Oyun yardımcı fonksiyonları
class GameUtils {
  static final Random _random = Random();

  /// Rastgele pozisyon oluştur
  static Vector2 randomPosition(Vector2 screenSize, Vector2 objectSize) {
    return Vector2(_random.nextDouble() * (screenSize.x - objectSize.x), _random.nextDouble() * (screenSize.y - objectSize.y));
  }

  /// Rastgele hız oluştur
  static Vector2 randomVelocity(double maxSpeed) {
    return Vector2((_random.nextDouble() - 0.5) * maxSpeed, (_random.nextDouble() - 0.5) * maxSpeed);
  }

  /// İki nokta arasındaki mesafeyi hesapla
  static double distance(Vector2 point1, Vector2 point2) {
    final dx = point1.x - point2.x;
    final dy = point1.y - point2.y;
    return sqrt(dx * dx + dy * dy);
  }

  /// Açıyı radyandan dereceye çevir
  static double radiansToDegrees(double radians) {
    return radians * 180 / pi;
  }

  /// Dereceyi radyana çevir
  static double degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  /// Değeri belirli aralıkta sınırla
  static double clamp(double value, double min, double max) {
    return value.clamp(min, max);
  }

  /// Rastgele boolean değer döndür
  static bool randomBool() {
    return _random.nextBool();
  }

  /// Rastgele sayı aralığında değer döndür
  static double randomRange(double min, double max) {
    return min + _random.nextDouble() * (max - min);
  }
}
