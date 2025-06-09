import 'package:color_match/levels.dart';
import 'package:color_match/menu.dart';
import 'package:flutter/material.dart';



class Weekly extends StatelessWidget {
  const Weekly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(137, 16, 10, 63),
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: const Text('Desafio Semanal'),
                          leading:IconButton(
                    icon:Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Menu();
                          },
                        ),
                      );
                    }
                )
        ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Desafio Semanal',textScaler: TextScaler.linear(3.5), style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
              Container(
                margin: const EdgeInsets.all(20),
                width: 300,
                height: 300,
                padding:EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30), // Borde redondeado
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [
                    Text('Completa al menos tres juegos',textScaler: TextScaler.linear(2), style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                    SizedBox(height: 16),
                    LinearProgressIndicator(
                      value: 0.7, // 70% completado
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ],
                )
              ),
              FilledButton(
                onPressed: (){
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Levels();
                          }
                        )
                      );
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white
                ),
                child: const Text('Iniciar Desafio'),
              )
            ],
          )
        ),
      ),
    );
  }
}