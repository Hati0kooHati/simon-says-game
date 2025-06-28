import 'package:flutter/material.dart';
import 'package:simon_says/providers/light_sequene_provider.dart';
import 'package:simon_says/widgets/buttons_widget.dart';
import 'package:provider/provider.dart';
import 'package:simon_says/widgets/start_game_widget.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<LightSequenceProvider>().backgroundColor,
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
              
                children: [
                  const SizedBox(height: 20),
              
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Level ${context.watch<LightSequenceProvider>().currentLevel}",
                        style: TextStyle(fontSize: 80, color: Colors.white),
                      ),
                    ],
                  ),
              
                  const SizedBox(height: 70),
              
                  ButtonsWidget(),
                ],
              ),
            ),

            if (context.read<LightSequenceProvider>().isGameNotStartted) 
              Positioned(child: StartGameWidget()),
          ],
        ),
      ),
    );
  }
}
