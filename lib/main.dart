import 'package:color_match/Menu.dart';
import 'package:flutter/material.dart';


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
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(137, 16, 10, 63),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        foregroundColor: Colors.white,),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/logo.GIF', width: 400.0),
            Container(
              margin: const EdgeInsets.only(top: 100),
              width: 300,
              height: 65,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  backgroundColor: WidgetStatePropertyAll(Colors.green),
                  overlayColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed))
                      return Colors.black.withGreen(122);
                    return null;
                  }),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Menu()),
                  );
                },
                child: const Text("Iniciar", style:TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
