import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../../game/game.dart';

/// Oyun ekranı
class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hafta 1 - Flame Temelleri'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.pause),
            onPressed: () {
              // Oyunu duraklat
            },
          ),
          IconButton(
            icon: const Icon(Icons.restart_alt),
            onPressed: () {
              // Oyunu yeniden başlat
            },
          ),
        ],
      ),
      body: Center(child: GameWidget(game: MyGame())),
    );
  }
}
