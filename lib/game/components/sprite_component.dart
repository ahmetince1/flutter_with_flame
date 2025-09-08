import 'package:flame/components.dart';

import '../../core/assets.dart';

/// Sprite kullanan component örneği
class GameSpriteComponent extends SpriteComponent {
  GameSpriteComponent({required Vector2 position, required Vector2 size, required String spritePath}) : super(position: position, size: size) {
    // Sprite'ı asenkron olarak yükle
    _loadSprite(spritePath);
  }

  Future<void> _loadSprite(String spritePath) async {
    sprite = await Sprite.load(spritePath);
  }

  /// Oyuncu sprite'ı oluştur
  factory GameSpriteComponent.player({required Vector2 position, Vector2? size}) {
    return GameSpriteComponent(position: position, size: size ?? Vector2(64, 64), spritePath: GameAssets.playerSprite);
  }

  /// Düşman sprite'ı oluştur
  factory GameSpriteComponent.enemy({required Vector2 position, Vector2? size}) {
    return GameSpriteComponent(position: position, size: size ?? Vector2(32, 32), spritePath: GameAssets.enemySprite);
  }

  /// Arka plan sprite'ı oluştur
  factory GameSpriteComponent.background({required Vector2 position, required Vector2 size}) {
    return GameSpriteComponent(position: position, size: size, spritePath: GameAssets.backgroundSprite);
  }
}
