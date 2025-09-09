import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class GameConstants {
  // Oyun boyutları
  static const double screenWidth = 400.0;
  static const double screenHeight = 800.0;

  // Kulvar sistemi
  static const double laneWidth = 120.0; // Her kulvarın genişliği
  static const double leftLaneX = 40.0; // Sol kulvar X pozisyonu
  static const double centerLaneX = 160.0; // Orta kulvar X pozisyonu
  static const double rightLaneX = 280.0; // Sağ kulvar X pozisyonu

  // Karakter boyutları
  static const double playerWidth = 60.0;
  static const double playerHeight = 80.0;
  static const double backgroundTileHeight = 100.0;

  // Hız ayarları
  static const double backgroundSpeed = 200.0; // Arkaplan hızı (pixel/saniye)
  static const double playerSpeed = 300.0; // Oyuncu hareket hızı

  // Pozisyonlar
  static final Vector2 playerStartPosition = Vector2(centerLaneX, 550); // Oyun alanının içinde
  static final Vector2 backgroundStartPosition = Vector2(0, -backgroundTileHeight);

  // Boyutlar
  static final Vector2 playerSize = Vector2(playerWidth, playerHeight);
  static final Vector2 backgroundTileSize = Vector2(screenWidth, backgroundTileHeight);

  // Renkler
  static const Color playerColor = Colors.green;
  static const Color backgroundTileColor = Colors.orange;
  static const Color tapCircleColor = Colors.blue;

  // Oyun ayarları
  static const double gameSpeed = 1.0;
  static const int maxLives = 3;
  static const int maxScore = 999999;

  // Kulvar pozisyonları listesi
  static const List<double> lanePositions = [leftLaneX, centerLaneX, rightLaneX];
}
