import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../../game/game.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hafta 1 - Flame Temelleri'), backgroundColor: Theme.of(context).colorScheme.inversePrimary, actions: [
          
        ],
      ),
      body: SafeArea(child: GameWidget(game: MyGame())),
    );
  }
}
