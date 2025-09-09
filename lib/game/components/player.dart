import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../../core/constants.dart';

/// Yeşil oyuncu karakteri (3 kulvar sistemi)
class Player extends RectangleComponent with HasGameReference {
  int _currentLane = 1; // 0: sol, 1: orta, 2: sağ
  bool _isMoving = false;
  late double _targetX;

  Player({required Vector2 position, required Vector2 size, required Color color}) : super(position: position, size: size, paint: Paint()..color = color) {
    _targetX = position.x;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
  }

  /// Sola hareket et
  void moveLeft() {
    if (_currentLane > 0) {
      _moveToLane(_currentLane - 1);
    }
  }

  /// Sağa hareket et
  void moveRight() {
    if (_currentLane < GameConstants.lanePositions.length - 1) {
      _moveToLane(_currentLane + 1);
    }
  }

  /// Belirtilen kulvara hareket et
  void moveToLane(int laneIndex) {
    _moveToLane(laneIndex);
  }

  /// Belirtilen kulvara hareket et
  void _moveToLane(int laneIndex) {
    if (laneIndex < 0 || laneIndex >= GameConstants.lanePositions.length) {
      print('Geçersiz kulvar indeksi: $laneIndex');
      return;
    }

    if (_currentLane == laneIndex) {
      print('Zaten $laneIndex. kulvarda, hareket etmiyor');
      return; // Zaten o kulvarda
    }

    if (_isMoving) {
      print('Hareket halinde, yeni hareket başlatılmıyor');
      return; // Hareket halinde
    }

    final oldLane = _currentLane;
    _currentLane = laneIndex;
    _targetX = GameConstants.lanePositions[laneIndex];
    _isMoving = true;

    print('Kulvar değişimi: $oldLane -> $laneIndex (X: $_targetX)');
  }

  @override
  void update(double dt) {
    super.update(dt);

    try {
      // Hedef pozisyona doğru hareket et
      if (_isMoving) {
        final distance = _targetX - position.x;
        final moveDistance = GameConstants.playerSpeed * dt;

        if (distance.abs() <= moveDistance) {
          // Hedefe ulaştı
          position.x = _targetX;
          _isMoving = false;
        } else {
          // Hedefe doğru hareket et
          position.x += distance.sign * moveDistance;
        }
      }
    } catch (e) {
      print('Player update hatası: $e');
    }
  }

  /// Mevcut kulvarı döndür
  int get currentLane => _currentLane;

  /// Hareket halinde mi?
  bool get isMoving => _isMoving;
}
