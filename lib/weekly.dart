import 'package:flutter/material.dart';
import 'package:color_match/levels.dart';
import 'package:color_match/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Weekly extends StatefulWidget {
  const Weekly({super.key});

  @override
  State<Weekly> createState() => _WeeklyState();
}

class _WeeklyState extends State<Weekly> {
  int pasoActual = 0;

  Future<void> _incrementarPaso() async {
    if (pasoActual < 3) {
      setState(() {
        pasoActual++;
      });

      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('pasoActual', pasoActual);

    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desafío Semanal',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(137, 16, 10, 63),
        appBar: AppBar(
          backgroundColor: Colors.black54,
          foregroundColor: Colors.white,
          title: const Text('Desafío Semanal'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Menu()),
              );
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Desafío\nSemanal',
                textAlign: TextAlign.center,
                textScaler: TextScaler.linear(3.5),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(40),
                width: 300,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Completa\nal menos\ntres juegos',
                      textAlign: TextAlign.center,
                      textScaler: TextScaler.linear(2),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    LinearProgressIndicator(
                      value: pasoActual / 3,
                      backgroundColor: Colors.grey[300],
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.blue),
                      minHeight: 12,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$pasoActual de 3',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              FilledButton(
                onPressed: () {
                  _incrementarPaso();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Levels()),
                  );
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(300, 65),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text('Iniciar Desafío'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
