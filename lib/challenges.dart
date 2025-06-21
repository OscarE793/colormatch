import 'package:color_match/Menu.dart';
import 'package:color_match/levels.dart';
import 'package:color_match/main.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class Challenges extends StatelessWidget {
  const Challenges({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
           title:const Text(''),
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  Text('DESAFIOS',textScaler: TextScaler.linear(3.5), style: TextStyle(fontWeight: FontWeight.bold),),
                  Container(
                     margin: EdgeInsets.only(top: 150),
                    width: 300,
                    height: 65,
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                        backgroundColor: WidgetStatePropertyAll(Colors.yellow),
                        overlayColor: WidgetStateProperty.resolveWith<Color?>((
                            Set<WidgetState> states,
                            ) {
                          if (states.contains(WidgetState.pressed)) {
                            return Colors.black.withGreen(122);
                          }
                          return null;
                        }),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Levels();
                            },
                          ),
                        );
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.bolt, size: 24, color: Colors.white), // Puedes cambiar el ícono
                            SizedBox(width: 8),
                            Text(
                              "Mente inalcanzable",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    width: 300,
                    height: 65,
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                        overlayColor: WidgetStateProperty.resolveWith<Color?>((
                            Set<WidgetState> states,
                            ) {
                          if (states.contains(WidgetState.pressed)) {
                            return Colors.black.withGreen(122);
                          }
                          return null;
                        }),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Levels();
                            },
                          ),
                        );
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.speed, size: 24, color: Colors.white), // Puedes cambiar el ícono
                            SizedBox(width: 8),
                            Text(
                              "A toda velocidad",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50, bottom: 150),
                    width: 300,
                    height: 65,
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                        backgroundColor: WidgetStatePropertyAll(Colors.red),
                        overlayColor: WidgetStateProperty.resolveWith<Color?>((
                            Set<WidgetState> states,
                            ) {
                          if (states.contains(WidgetState.pressed)) {
                            return Colors.black.withGreen(122);
                          }
                          return null;
                        }),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Levels();
                            },
                          ),
                        );
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.videogame_asset, size: 24, color: Colors.white), // Puedes cambiar el ícono
                            SizedBox(width: 8),
                            Text(
                              "Desafia tu suerte",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                    ),
                  ),
                ],

              
          ),
        ),
      ),
    );
  }
}