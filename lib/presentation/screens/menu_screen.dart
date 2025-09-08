import 'package:flutter/material.dart';

import '../widgets/game_button.dart';

/// Ana menü ekranı
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.blue, Colors.purple])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Flame Temel Öğrenme', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 50),
              GameButton(
                text: 'Oyunu Başlat',
                onPressed: () {
                  Navigator.pushNamed(context, '/game');
                },
              ),
              const SizedBox(height: 20),
              GameButton(
                text: 'Ayarlar',
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
              ),
              const SizedBox(height: 20),
              GameButton(
                text: 'Çıkış',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
