import 'package:flutter/material.dart';

enum CardState {hidden, visible, guessed}

//Nos permite chequear el estado de cada "carta" para así mostrar el color cuando se oprima. 
class Card{
  final int value;
  CardState state;

  Card(
    this.value, {
    this.state = CardState.hidden,
  });

  Color get color{
    switch(value){
      case 1:
        return Colors.green;
      case 2: 
        return Colors.amber;
      case 3: 
        return Colors.blue;
      case 4:
        return Colors.red;
      case 5: 
        return Colors.deepPurple;
      case 6:
        return Colors.pink;
      case 7:
        return Colors.teal;
      case 8:
        return Colors.black26;
      case 9:
        return Colors.orange;
      default:
        return Colors.blueGrey; //En caso de que no se dé ninguno de los valores, se mastrará la carta en gris. 
    }
  }


}