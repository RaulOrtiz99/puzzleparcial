
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
  /// moves one or more tile vertically or horizontally
  Puzzle move(Tile tile) {
    final copy = [...tiles];
    // left or right
    if (tile.position.y == emptyPosition.y) {
      final row = tiles.where(
            (e) => e.position.y == emptyPosition.y,
      );

      // right
      if (tile.position.x < emptyPosition.x) {// si es verdad se mueven a la derecha
        for (final e in row) {
          if (e.position.x < tile.position.x || e.position.x > emptyPosition.x) {
            continue;
          }
          copy[e.value - 1] = e.move(
            Position(
              x: e.position.x + 1,
              y: e.position.y,
            ),
          );
        }
      } else {
        // si es falso se muven los elementos a la izquierda
        for (final e in row) {
          if (e.position.x > tile.position.x || e.position.x < emptyPosition.x) {
            continue;
          }
          copy[e.value - 1] = e.move(
            Position(
              x: e.position.x - 1,
              y: e.position.y,
            ),
          );
        }
      }
    } else { //si es falso se mueve arriba o abajo
      // top or bottom
      final column = tiles.where(
            (e) => e.position.x == emptyPosition.x,
      );

      // bottom si es abajo el movimiento
      if (tile.position.y < emptyPosition.y) {
        for (final e in column) {
          if (e.position.y > emptyPosition.y || e.position.y < tile.position.y) {
            continue;
          }
          copy[e.value - 1] = e.move(
            Position(
              x: e.position.x,
              y: e.position.y + 1,
            ),
          );
        }
      } else { //si el movimiento es para arriba
        // top
        for (final e in column) {
          if (e.position.y < emptyPosition.y || e.position.y > tile.position.y) {
            continue;
          }
          copy[e.value - 1] = e.move(
            Position(
              x: e.position.x,
              y: e.position.y - 1,
            ),
          );
        }
      }
    }
    return Puzzle._(
      tiles: copy,
      emptyPosition: tile.position,
    );
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