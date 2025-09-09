import 'package:flutter/material.dart';

import 'presentation/screens/game_screen.dart';
import 'presentation/screens/menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flame Temel Öğrenme',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), useMaterial3: true),
      initialRoute: '/',
      routes: {'/': (context) => const MenuScreen(), '/game': (context) => const GameScreen(), '/settings': (context) => const SettingsScreen()},
    );
  }
}

/// Ayarlar ekranı (basit versiyon)
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ayarlar'), backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: const Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Ayarlar ekranı'), Text('Burada oyun ayarları olacak')]),
      ),
    );
  }
}
