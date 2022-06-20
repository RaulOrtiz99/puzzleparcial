

import 'package:equatable/equatable.dart';

import '../../../../domain/models/puzzle.dart';

class GameState extends Equatable {
  final int crossAxisCount;
  final Puzzle puzzle;
  final bool solved;
  final int moves;

  GameState({
    required this.crossAxisCount,
    required this.puzzle,
    required this.solved,
    required this.moves,
  });

  GameState copyWith({
    int? crossAxisCount,
    int? moves,
    Puzzle? puzzle,
    bool? solved,
  }) {
    return GameState(
      crossAxisCount: crossAxisCount ?? this.crossAxisCount,
      moves: moves ?? this.moves,
      puzzle: puzzle ?? this.puzzle,
      solved: solved ?? this.solved,
    );
  }

  @override
  List<Object?> get props => [
    moves,
    crossAxisCount,
    puzzle,
    solved,
  ];
}
