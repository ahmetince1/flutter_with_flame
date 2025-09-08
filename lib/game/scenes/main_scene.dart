import 'package:flame/components.dart';

import '../../core/constants.dart';
import '../components/controllable_rectangle.dart';
import '../components/moving_square.dart';
import '../components/static_rectangle.dart';

/// Ana oyun sahnesi
class MainScene extends Component {
  late StaticRectangle redSquare;
  late ControllableRectangle blueRectangle;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    try {
      // Kırmızı kare oluştur
      redSquare = StaticRectangle(position: GameConstants.redSquarePosition, size: GameConstants.redSquareSize, color: GameConstants.redSquareColor);

      // Mavi dikdörtgen oluştur (kontrol edilebilir)
      blueRectangle = ControllableRectangle(position: GameConstants.blueRectanglePosition, size: GameConstants.blueRectangleSize, color: GameConstants.blueRectangleColor);

      // Component'leri sahneye ekle
      add(redSquare);
      add(blueRectangle);

      // Hareketli kare ekle
      add(MovingSquare(position: GameConstants.movingSquarePosition, size: GameConstants.movingSquareSizeVector, color: GameConstants.movingSquareColor));
    } catch (e) {
      print('MainScene yükleme hatası: $e');
    }
  }
}
