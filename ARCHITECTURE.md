# 🏗️ Flame Oyun Mimarisi Dokümantasyonu

## 📋 İçindekiler

1. [Genel Bakış](#genel-bakış)
2. [Mimari Prensipler](#mimari-prensipler)
3. [Klasör Yapısı](#klasör-yapısı)
4. [Katmanlar](#katmanlar)
5. [Component Sistemi](#component-sistemi)
6. [Veri Akışı](#veri-akışı)
7. [Best Practices](#best-practices)
8. [Geliştirme Rehberi](#geliştirme-rehberi)

---

## 🎯 Genel Bakış

Bu proje, **Clean Architecture** prensiplerine dayalı olarak tasarlanmış bir Flutter + Flame oyun projesidir. Mimari, kodun sürdürülebilirliğini, test edilebilirliğini ve ölçeklenebilirliğini sağlamak için modüler bir yapı kullanır.

### 🎮 Teknoloji Stack'i

- **Flutter**: 3.35.3
- **Flame**: 1.32.0
- **Dart**: 3.9.2
- **Mimari**: Clean Architecture + Feature-First

---

## 🏛️ Mimari Prensipler

### 1. **Separation of Concerns (Sorumluluk Ayrımı)**
Her katman kendi sorumluluğuna odaklanır:
- **Core**: Temel yapı taşları
- **Game**: Oyun mantığı
- **Presentation**: Kullanıcı arayüzü

### 2. **Dependency Inversion (Bağımlılık Tersine Çevirme)**
Üst katmanlar alt katmanlara bağımlıdır, tersi değil.

### 3. **Single Responsibility (Tek Sorumluluk)**
Her sınıf ve fonksiyon tek bir işten sorumludur.

### 4. **Open/Closed Principle (Açık/Kapalı Prensibi)**
Kod genişletmeye açık, değişikliğe kapalıdır.

---

## 📁 Klasör Yapısı

```
lib/
├── main.dart                           # 🚀 Uygulama giriş noktası
├── core/                              # 🔧 Temel yapı taşları
│   ├── assets.dart                    # 📦 Varlık yolları
│   ├── constants.dart                 # 📊 Sabit değerler
│   └── utils.dart                     # 🛠️ Yardımcı fonksiyonlar
├── game/                              # 🎮 Oyun mantığı
│   ├── components/                    # 🧩 Oyun component'leri
│   │   ├── moving_square.dart         # ⬜ Hareketli kare
│   │   ├── static_rectangle.dart      # 🔲 Statik dikdörtgen
│   │   └── sprite_component.dart      # 🖼️ Sprite component'i
│   ├── levels/                        # 🎯 Oyun seviyeleri
│   │   └── level1.dart                # 1️⃣ Seviye 1
│   ├── scenes/                        # 🎬 Oyun sahneleri
│   │   └── main_scene.dart            # 🎭 Ana sahne
│   └── game.dart                      # 🎮 Ana oyun sınıfı
├── presentation/                      # 🖥️ Kullanıcı arayüzü
│   ├── screens/                       # 📱 Ekranlar
│   │   ├── game_screen.dart           # 🎮 Oyun ekranı
│   │   └── menu_screen.dart           # 📋 Menü ekranı
│   └── widgets/                       # 🧩 Widget'lar
│       ├── game_button.dart           # 🔘 Oyun butonu
│       └── score_display.dart         # 📊 Skor gösterimi
└── assets/                            # 🎨 Oyun varlıkları
    ├── images/                        # 🖼️ Resimler
    │   ├── player.svg                 # 👤 Oyuncu karakteri
    │   ├── enemy.svg                  # 👹 Düşman karakteri
    │   └── background.svg             # 🌄 Arka plan
    ├── sounds/                        # 🔊 Sesler
    │   └── README.md                  # 📝 Ses rehberi
    └── animations/                    # 🎬 Animasyonlar
        └── README.md                  # 📝 Animasyon rehberi
```

---

## 🏗️ Katmanlar

### 🔧 Core Katmanı

**Amaç**: Uygulamanın temel yapı taşlarını içerir.

#### `constants.dart`
```dart
class GameConstants {
  // Component boyutları
  static const double squareSize = 100.0;
  
  // Pozisyonlar
  static final Vector2 redSquarePosition = Vector2(50, 50);
  
  // Renkler
  static const Color redSquareColor = Colors.red;
}
```

#### `assets.dart`
```dart
class GameAssets {
  // Resim yolları
  static const String imagesPath = 'assets/images/';
  static const String playerSprite = '${imagesPath}player.svg';
  static const String enemySprite = '${imagesPath}enemy.svg';
  static const String backgroundSprite = '${imagesPath}background.svg';
  
  // Ses yolları
  static const String soundsPath = 'assets/sounds/';
  static const String backgroundMusic = '${soundsPath}background_music.mp3';
  static const String jumpSound = '${soundsPath}jump.wav';
  static const String collectSound = '${soundsPath}collect.wav';
  
  // Animasyon yolları
  static const String animationsPath = 'assets/animations/';
  static const String playerIdle = '${animationsPath}player_idle.json';
  static const String playerRun = '${animationsPath}player_run.json';
  static const String playerJump = '${animationsPath}player_jump.json';
  
  // Yardımcı metodlar
  static List<String> get allImages => [playerSprite, enemySprite, backgroundSprite];
  static List<String> get allSounds => [backgroundMusic, jumpSound, collectSound];
  static List<String> get allAnimations => [playerIdle, playerRun, playerJump];
  
  // Varlık kontrolü
  static bool hasImage(String imageName) => allImages.any((path) => path.contains(imageName));
  static bool hasSound(String soundName) => allSounds.any((path) => path.contains(soundName));
  static bool hasAnimation(String animationName) => allAnimations.any((path) => path.contains(animationName));
}
```

#### `utils.dart`
```dart
class GameUtils {
  // Rastgele pozisyon oluştur
  static Vector2 randomPosition(Vector2 screenSize, Vector2 objectSize);
  
  // İki nokta arasındaki mesafeyi hesapla
  static double distance(Vector2 point1, Vector2 point2);
}
```

### 🎮 Game Katmanı

**Amaç**: Oyun mantığını ve component'lerini içerir.

#### Ana Oyun Sınıfı
```dart
class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(MainScene());
  }
}
```

#### Component Sistemi
```dart
// Statik component
class StaticRectangle extends RectangleComponent {
  // Statik dikdörtgen mantığı
}

// Hareketli component
class MovingSquare extends RectangleComponent with HasGameReference {
  late Vector2 velocity;
  
  @override
  void update(double dt) {
    position += velocity * dt;
  }
}

// Sprite component
class GameSpriteComponent extends SpriteComponent {
  GameSpriteComponent({required Vector2 position, required Vector2 size, required String spritePath}) 
    : super(position: position, size: size) {
    _loadSprite(spritePath);
  }
  
  Future<void> _loadSprite(String spritePath) async {
    sprite = await Sprite.load(spritePath);
  }
  
  // Factory metodlar
  factory GameSpriteComponent.player({required Vector2 position, Vector2? size}) {
    return GameSpriteComponent(position: position, size: size ?? Vector2(64, 64), spritePath: GameAssets.playerSprite);
  }
  
  factory GameSpriteComponent.enemy({required Vector2 position, Vector2? size}) {
    return GameSpriteComponent(position: position, size: size ?? Vector2(32, 32), spritePath: GameAssets.enemySprite);
  }
}
```

#### Sahne Sistemi
```dart
class MainScene extends Component {
  @override
  Future<void> onLoad() async {
    // Component'leri sahneye ekle
    add(StaticRectangle(...));
    add(MovingSquare(...));
  }
}
```

### 🖥️ Presentation Katmanı

**Amaç**: Kullanıcı arayüzünü yönetir.

#### Ekranlar
```dart
class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: GameWidget(game: MyGame())),
    );
  }
}
```

#### Widget'lar
```dart
class GameButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  
  // Özel buton tasarımı
}
```

---

## 🧩 Component Sistemi

### Component Hiyerarşisi

```
Component (Flame Base)
├── RectangleComponent
│   ├── StaticRectangle
│   └── MovingSquare
├── CircleComponent
├── SpriteComponent
│   └── GameSpriteComponent
└── Custom Components
    ├── Player
    ├── Enemy
    └── PowerUp
```

### Component Lifecycle

1. **onLoad()**: Component yüklendiğinde çalışır
2. **update()**: Her frame'de çalışır
3. **render()**: Component çizildiğinde çalışır
4. **onRemove()**: Component kaldırıldığında çalışır

### Component Ekleme

```dart
// Sahneye component ekleme
add(StaticRectangle(...));

// Component'e alt component ekleme
redSquare.add(CircleComponent(...));
```

---

## 🔄 Veri Akışı

### 1. **Kullanıcı Etkileşimi**
```
User Input → Presentation Layer → Game Layer → Components
```

### 2. **Oyun Durumu**
```
Game State → Core Layer → Presentation Layer → UI Update
```

### 3. **Component İletişimi**
```
Component A → Event System → Component B
```

---

## ✅ Best Practices

### 1. **Kod Organizasyonu**

#### ✅ Doğru
```dart
// Constants kullan
add(RectangleComponent(
  position: GameConstants.redSquarePosition,
  size: GameConstants.redSquareSize,
  paint: Paint()..color = GameConstants.redSquareColor,
));
```

#### ❌ Yanlış
```dart
// Magic numbers kullanma
add(RectangleComponent(
  position: Vector2(50, 50),
  size: Vector2(100, 100),
  paint: Paint()..color = Colors.red,
));
```

### 2. **Error Handling**

#### ✅ Doğru
```dart
@override
Future<void> onLoad() async {
  super.onLoad();
  
  try {
    add(StaticRectangle(...));
  } catch (e) {
    print('Component yükleme hatası: $e');
  }
}
```

#### ❌ Yanlış
```dart
@override
Future<void> onLoad() async {
  super.onLoad();
  add(StaticRectangle(...)); // Hata kontrolü yok
}
```

### 3. **Import Organizasyonu**

#### ✅ Doğru
```dart
// 1. Dart core imports
import 'dart:math';

// 2. Flutter imports
import 'package:flutter/material.dart';

// 3. Flame imports
import 'package:flame/components.dart';

// 4. Local imports
import '../core/constants.dart';
```

### 4. **Naming Conventions**

- **Sınıflar**: PascalCase (`GameConstants`)
- **Fonksiyonlar**: camelCase (`randomPosition`)
- **Sabitler**: UPPER_SNAKE_CASE (`MAX_LIVES`)
- **Dosyalar**: snake_case (`game_screen.dart`)

---

## 🚀 Geliştirme Rehberi

### Yeni Component Ekleme

1. **Component sınıfını oluştur**:
```dart
// lib/game/components/new_component.dart
class NewComponent extends RectangleComponent {
  // Component mantığı
}
```

2. **Constants'a değerleri ekle**:
```dart
// lib/core/constants.dart
class GameConstants {
  static const double newComponentSize = 50.0;
  static const Color newComponentColor = Colors.purple;
}
```

3. **Asset varsa assets.dart'a ekle**:
```dart
// lib/core/assets.dart
class GameAssets {
  static const String newComponentSprite = '${imagesPath}new_component.svg';
}
```

4. **Sahneye ekle**:
```dart
// lib/game/scenes/main_scene.dart
add(NewComponent(
  position: GameConstants.newComponentPosition,
  size: GameConstants.newComponentSize,
  color: GameConstants.newComponentColor,
));
```

### Yeni Seviye Ekleme

1. **Seviye sınıfını oluştur**:
```dart
// lib/game/levels/level2.dart
class Level2 extends Component {
  @override
  Future<void> onLoad() async {
    // Seviye 2 mantığı
  }
}
```

2. **Seviye yöneticisine ekle**:
```dart
// lib/game/level_manager.dart
class LevelManager {
  static Component getLevel(int levelNumber) {
    switch (levelNumber) {
      case 1: return Level1();
      case 2: return Level2();
      default: return Level1();
    }
  }
}
```

### Yeni Ekran Ekleme

1. **Ekran sınıfını oluştur**:
```dart
// lib/presentation/screens/settings_screen.dart
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ayarlar ekranı
  }
}
```

2. **Route'a ekle**:
```dart
// lib/main.dart
routes: {
  '/': (context) => const MenuScreen(),
  '/game': (context) => const GameScreen(),
  '/settings': (context) => const SettingsScreen(),
}
```

---

## 🧪 Test Stratejisi

### Unit Testler
```dart
// test/game/components/moving_square_test.dart
void main() {
  group('MovingSquare', () {
    test('should move with velocity', () {
      // Test mantığı
    });
  });
}
```

### Widget Testler
```dart
// test/presentation/widgets/game_button_test.dart
void main() {
  testWidgets('GameButton should call onPressed', (tester) async {
    // Widget test mantığı
  });
}
```

---

## 📈 Performans Optimizasyonu

### 1. **Component Pooling**
```dart
class ComponentPool {
  static final List<CircleComponent> _pool = [];
  
  static CircleComponent getCircle() {
    if (_pool.isEmpty) {
      return CircleComponent();
    }
    return _pool.removeLast();
  }
  
  static void returnCircle(CircleComponent circle) {
    _pool.add(circle);
  }
}
```

### 2. **Lazy Loading**
```dart
class LazyComponent extends Component {
  bool _loaded = false;
  
  @override
  void update(double dt) {
    if (!_loaded && shouldLoad()) {
      _loadComponent();
      _loaded = true;
    }
  }
}
```

---

## 🔧 Debugging

### Debug Araçları

1. **Flame Inspector**: `flutter run --debug`
2. **Performance Overlay**: `flutter run --profile`
3. **Memory Usage**: `flutter run --debug --verbose`

### Log Sistemi

```dart
class GameLogger {
  static void log(String message) {
    if (kDebugMode) {
      print('[GAME] $message');
    }
  }
}
```

---

## 📚 Kaynaklar

- [Flame Dokümantasyonu](https://docs.flame-engine.org/)
- [Flutter Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter Best Practices](https://docs.flutter.dev/development/data-and-backend/state-mgmt)

---

## 🤝 Katkıda Bulunma

1. Fork yapın
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Commit yapın (`git commit -m 'Add amazing feature'`)
4. Push yapın (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

---

## 📄 Lisans

Bu proje MIT lisansı altında lisanslanmıştır. Detaylar için `LICENSE` dosyasına bakın.

---

**Son Güncelleme**: 2024
**Versiyon**: 1.0.0
**Geliştirici**: Flame Learning Team
