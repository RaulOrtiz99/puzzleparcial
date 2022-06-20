import 'package:examenparcial2software1/src/ui/pages/game/widgets/puzzle_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/game_controller.dart';

class PuzzleInteractor extends StatelessWidget {
  const PuzzleInteractor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final controller = context.watch<GameController>();
          final state = controller.state;
          final tileSize = constraints.maxWidth / state.crossAxisCount;

          return Stack(
            children: state.puzzle.tiles
                .map(
                  (e) => PuzzleTile(
                tile: e,
                size: tileSize,
                onTap: () => controller.onTileTapped(e),
              ),
            )
                .toList(),
          );
        },
      ),
    );
  }
}
