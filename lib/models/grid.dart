import 'dart:async';
import 'dart:math';

import 'card.dart';

class Grid {
  int size;
  List<Card> cards =
      []; //Lista de  las diferentes cartas que se muestran en el juego
  bool finished = false; //Nos permite saber si el juego está terminado.

  Grid(this.size) {
    cardsGeneration();
  }
  //Metodo para añadir las cartas a la lista y luego revolverlas.
  void cardsGeneration() {
    //cards[];

    for (int i = 0; i < (size * size) / 2; i++) {
      int cardValue = i + 1;
      cards.add(Card(cardValue, state: CardState.hidden));
      cards.add(Card(cardValue, state: CardState.hidden));
    }

    cards.shuffle(Random());
  }
  
  //reseteamos valores y generamos cartas.
  void resetGame(){
    cardsGeneration();
    finished = false;
  }

  
}
