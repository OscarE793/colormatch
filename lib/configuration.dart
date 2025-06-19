import 'package:color_match/Menu.dart';
import 'package:color_match/main.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class Configuration extends StatelessWidget {
  const Configuration({super.key});

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
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Configuration'),
            ],
          ),
        ),
      ),
    );
  }
}