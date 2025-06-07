import 'package:flutter/material.dart';
import 'package:color_match/levels.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(137, 16, 10, 63),
      appBar: AppBar(backgroundColor: Colors.black54),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/logo.GIF', width: 400.0),
            Container(
              margin: const EdgeInsets.only(top: 100),
              width: 200,
              height: 50,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
                  overlayColor: WidgetStateProperty.resolveWith<Color?>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.pressed)) {
                        return Colors.greenAccent;
                      }
                      return null;
                    },
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Levels()),
                  );
                },
                child: const Text("Play"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
