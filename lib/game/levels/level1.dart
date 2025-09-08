import 'package:flame/components.dart';

import '../scenes/main_scene.dart';

/// Seviye 1 - Temel öğrenme seviyesi
class Level1 extends Component {
  late MainScene gameScene;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    try {
      // Ana sahneyi oluştur
      gameScene = MainScene();
      add(gameScene);

      // Seviye 1'e özel ayarlar
      _setupLevel1();
    } catch (e) {
      print('Level1 yükleme hatası: $e');
    }
  }

  void _setupLevel1() {
    // Seviye 1'e özel konfigürasyon
    // Örnek: Daha yavaş hareket, daha az düşman, vb.
  }
}
