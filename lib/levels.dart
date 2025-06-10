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
              'Seleccione \n  el nivel',
              textScaler: TextScaler.linear(3.5),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
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
                      builder: (context) => const GameScreen(difficulty: 'Facil'),
                    ),
                  );
                },
                child: const Text('FACIL', style:TextStyle(fontSize: 20)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
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
                      builder: (context) => const GameScreen(difficulty: 'Normal'),
                    ),
                  );
                },
                child: const Text('NORMAL', style:TextStyle(fontSize: 20)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
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
                      builder: (context) => const GameScreen(difficulty: 'Dificil'),
                    ),
                  );
                },
                child: const Text('DIFICIL', style:TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
