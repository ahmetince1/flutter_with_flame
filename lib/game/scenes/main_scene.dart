import 'package:flame/components.dart';

import '../../core/constants.dart';
import '../components/falling_arrows.dart';
import '../components/player.dart';
import '../components/simple_scrolling_background.dart';

class MainScene extends Component with HasGameReference {
  late Player player;
  late SimpleScrollingBackground background;
  late FallingArrows fallingArrows;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    try {
      background = SimpleScrollingBackground();
      add(background);

      fallingArrows = FallingArrows();
      add(fallingArrows);

      player = Player(position: Vector2(GameConstants.centerLaneX, 590), size: GameConstants.playerSize, color: GameConstants.playerColor);
      add(player);
    } catch (e) {
      print('MainScene yükleme hatası: $e');
    }
  }
}
