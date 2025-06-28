import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simon_says/providers/light_sequene_provider.dart';

class StartGameWidget extends StatelessWidget {
  const StartGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKeyEvent: (event) {
        context.read<LightSequenceProvider>().isGameNotStartted = false;
        context.read<LightSequenceProvider>().startGame();
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(45, 255, 255, 255),
        child: Center(child: Text("Tab enter to start", style: TextStyle(color: Colors.white, fontSize: 30),)),
      ),
    );
  }

}