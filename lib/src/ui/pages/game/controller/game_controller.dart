
import 'package:examenparcial2software1/src/ui/pages/game/controller/game_state.dart';
import 'package:flutter/material.dart';

import '../../../../domain/models/puzzle.dart';
import '../../../../domain/models/tile.dart';

class GameController extends ChangeNotifier{

  GameState _state = GameState(
    crossAxisCount: 4,
    puzzle: Puzzle.create(4),
    solved: false,
    moves: 0,
  );

  GameState get state => _state;

  Puzzle get puzzle => _state.puzzle;

  void onTileTapped(Tile tile) {
    final canMove = puzzle.canMove(tile.position);
    if (canMove) {
      _state =  state.copyWith(puzzle:puzzle.move(tile));
      notifyListeners();
    }
  }
}