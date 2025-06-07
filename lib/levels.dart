import 'package:flutter/material.dart';
import 'package:color_match/game_screen.dart';

class Levels extends StatelessWidget {
  const Levels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Select Level',
              textScaler: TextScaler.linear(3.5),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 150),
              width: 300,
              height: 65,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  backgroundColor: WidgetStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GameScreen(difficulty: 'easy'),
                    ),
                  );
                },
                child: const Text('EASY'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 100),
              width: 300,
              height: 65,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  backgroundColor: WidgetStateProperty.all(Colors.deepPurple),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GameScreen(difficulty: 'medium'),
                    ),
                  );
                },
                child: const Text('MEDIUM'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 100),
              width: 300,
              height: 65,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  backgroundColor: WidgetStateProperty.all(Colors.amber),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GameScreen(difficulty: 'hard'),
                    ),
                  );
                },
                child: const Text('HARD'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
