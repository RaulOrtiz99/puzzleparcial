

import 'package:equatable/equatable.dart';
import 'package:examenparcial2software1/src/domain/models/position.dart';

class Tile extends Equatable {

  final int value; //esto es el valor del tamanio de la grilla o matriz
  final Position
  position; //posicion almacenara un valor del rompecabezas pero no necessariamente la posicion correcta sino random
  final Position
  correctPosition; //esta variable almacenara la posicion correcta del rompecabezas o mas bien de la pieza

  const Tile({
    required this.value,
    required this.position,
    required this.correctPosition,
  });

  Tile move(Position newPosition) {
    //esto es para mover el rompecabezas
    return Tile(
      value: value,
      correctPosition: correctPosition,
      position:
      newPosition, //esto sera lo que cambie por que correct position y value siempre searan los mismos
    );
  }

  @override
  List<Object?> get props => [position, correctPosition];
}