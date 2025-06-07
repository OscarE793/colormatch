import 'package:flutter/material.dart';
import 'dart:math';

class GameScreen extends StatefulWidget {
  final String difficulty;

  const GameScreen({super.key, required this.difficulty});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late int numPairs;
  late int crossAxisCount;
  late List<Color> _colors;
  late List<bool> _revealed;
  int? _firstSelected;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _configureLevel();
    _generateBoard();
  }

  void _configureLevel() {
    switch (widget.difficulty.toLowerCase()) {
      case 'medium':
        numPairs = 10;
        crossAxisCount = 5;
        break;
      case 'hard':
        numPairs = 12;
        crossAxisCount = 6;
        break;
      case 'easy':
      default:
        numPairs = 8;
        crossAxisCount = 4;
        break;
    }
  }

  void _generateBoard() {
    List<Color> baseColors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.cyan,
      Colors.lime,
      Colors.indigo,
      Colors.brown,
    ];

    _colors = [...baseColors.take(numPairs), ...baseColors.take(numPairs)];
    _colors.shuffle();

    _revealed = List.generate(_colors.length, (_) => false);
  }

  void _onTileTap(int index) {
    if (_revealed[index]) return;

    setState(() {
      _revealed[index] = true;
    });

    if (_firstSelected == null) {
      _firstSelected = index;
    } else {
      final secondSelected = index;
      if (_colors[_firstSelected!] != _colors[secondSelected]) {
        Future.delayed(const Duration(milliseconds: 800), () {
          setState(() {
            _revealed[_firstSelected!] = false;
            _revealed[secondSelected] = false;
            _firstSelected = null;
          });
        });
      } else {
        // Correct match
        score += 10;
        _firstSelected = null;
      }
    }
  }

  bool get _hasWon => _revealed.every((r) => r);

  @override
  Widget build(BuildContext context) {
    if (_hasWon) {
      Future.microtask(() => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => AlertDialog(
              title: const Text("¡Felicidades!"),
              content: Text("Completaste el nivel ${widget.difficulty} 🎉"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OK"),
                )
              ],
            ),
          ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Level: ${widget.difficulty}'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text('Score: $score', style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _colors.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _onTileTap(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: _revealed[index]
                          ? _colors[index]
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black12),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
