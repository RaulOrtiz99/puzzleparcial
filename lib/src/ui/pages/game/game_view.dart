import 'package:examenparcial2software1/src/ui/pages/game/widgets/puzzle_interactor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/game_controller.dart';

class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameController(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PuzzleInteractor(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
