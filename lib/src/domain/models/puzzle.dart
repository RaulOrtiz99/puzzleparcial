
import 'package:equatable/equatable.dart';
import 'package:examenparcial2software1/src/domain/models/position.dart';
import 'package:examenparcial2software1/src/domain/models/tile.dart';

class Puzzle extends Equatable{
  //esto es un rompecabezas
  final List<Tile>
  tiles; //esto es una lista de tiles o de piezas del rompecabezas

  final Position
  emptyPosition; // esto guarda la posicion vacia de nuestro rompecabezas

  const Puzzle._({
    required this.tiles, // lista de tiles

    required this.emptyPosition, // posición del tile vacío
  });

//

  bool canMove(Position tilePosition) {
    if (tilePosition.x == emptyPosition.x ||
        tilePosition.y == emptyPosition.y) {
      return true;
    }
    return false;
  }

  //esta funcion factory es para crear un rompecabezas

  factory Puzzle.create(int crossAxisCount) {
    // crea un puzzle de tamaño NxN
    int value = 1; // valor inicial de los tiles
    final tiles = <Tile>[]; // lista de tiles
    final emptyPosition = Position(
      // posición del tile vacío
      x: crossAxisCount, // posición en x del tile vacío
      y: crossAxisCount, // posición en y del tile vacío
    );
    for (int y = 1; y <= crossAxisCount; y++) {
      // recorre la matriz
      //int value = 1; // valor inicial de los tiles
      for (int x = 1; x <= crossAxisCount; x++) {
        // recorre la matriz
        final add = !(x == crossAxisCount &&
            y == crossAxisCount); // si no es el último tile
        if (add) {
          // si no es el tile vacío
          final position = Position(x: x, y: y); // posición del tile
          final tile = Tile(
            // tile
            value: value, // valor del tile
            position: position,
            correctPosition: position,
          );
          tiles.add(tile); // agrega el tile a la lista
          value++;
        }
      }
    }

    return Puzzle._(
      tiles: tiles,
      emptyPosition: emptyPosition,
    );
  }

  @override
  List<Object?> get props => [
    tiles,
    emptyPosition,
  ];

}