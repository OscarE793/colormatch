import 'package:flutter/material.dart';
import 'package:color_match/Menu.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Match',
      debugShowCheckedModeBanner: false,
      home: const LeaderBoard(),
    );
  }
}

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({super.key});

  final List<String> jugadores = const [
    'Juan Valencia   12500',
    'Carlos López    11300',
    'Ana Pérez       10000',
    'Luis Torres     9000',
    'María Gómez     8000',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(137, 16, 10, 63),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black54,
        title: const Text(''),
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
          children: [
            Image.asset('assets/images/logo.GIF', width: 200),
            const SizedBox(height: 0),
            const Text(
              'CLASIFICACIÓN',
              textScaler: TextScaler.linear(2),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black54,
                    blurRadius: 8,
                    offset: Offset(2, 2),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 500,
              width: 400,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView.builder(
                itemCount: jugadores.length,
                itemBuilder: (context, index) {
                  return JugadorTile(
                    posicion: index + 1,
                    nombre: jugadores[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JugadorTile extends StatelessWidget {
  final int posicion;
  final String nombre;

  const JugadorTile({
    super.key,
    required this.posicion,
    required this.nombre,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          
          const SizedBox(width: 12),
          Container(
            width: 300,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$posicion  $nombre',
              textScaler: TextScaler.linear(1.3),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                shadows: [
                  Shadow(
                    color: Colors.black45,
                    blurRadius: 6,
                    offset: Offset(2, 2),
                  )
                ],
              ),
            ),
)

        ],
      ),
    );
  }
}

