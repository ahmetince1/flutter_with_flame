import 'package:flutter/material.dart';

/// Skor gösterimi widget'ı
class ScoreDisplay extends StatelessWidget {
  final int score;
  final int highScore;
  final int lives;

  const ScoreDisplay({super.key, required this.score, required this.highScore, required this.lives});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.7), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [_buildScoreItem('Skor', score.toString()), _buildScoreItem('En Yüksek', highScore.toString()), _buildScoreItem('Can', lives.toString())],
      ),
    );
  }

  Widget _buildScoreItem(String label, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
