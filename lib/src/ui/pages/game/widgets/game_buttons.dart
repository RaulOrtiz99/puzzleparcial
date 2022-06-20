import 'package:examenparcial2software1/src/ui/pages/game/controller/game_controller.dart';
import 'package:examenparcial2software1/src/ui/pages/game/controller/game_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameButtons extends StatelessWidget {
  const GameButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context
        .watch<GameController>(); //esto es para recuperar el gamecontroller
    final state = controller.state;
    return Padding(
      padding: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.replay),
              label:
                  Text(state.status == GameStatus.created ? "START" : "RESET"))
        ],
      ),
    );
  }
}
