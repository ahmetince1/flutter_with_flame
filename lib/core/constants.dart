import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class GameConstants {
  // Component boyutları
  static const double squareSize = 100.0;
  static const double movingSquareSize = 60.0;
  static const double circleRadius = 25.0;

  // Hız ayarları
  static const double velocityMultiplier = 0.5; // 5x daha hızlı

  // Pozisyonlar
  static final Vector2 redSquarePosition = Vector2(50, 50);
  static final Vector2 blueRectanglePosition = Vector2(200, 100);
  static final Vector2 movingSquarePosition = Vector2(300, 200);

  // Boyutlar
  static final Vector2 redSquareSize = Vector2(100, 100);
  static final Vector2 blueRectangleSize = Vector2(150, 80);
  static final Vector2 movingSquareSizeVector = Vector2(60, 60);

  // Renkler
  static const Color redSquareColor = Colors.red;
  static const Color blueRectangleColor = Colors.blue;
  static const Color movingSquareColor = Colors.orange;
  static const Color tapCircleColor = Colors.green;

  // Oyun ayarları
  static const double gameSpeed = 1.0;
  static const int maxLives = 3;
  static const int maxScore = 999999;
}
