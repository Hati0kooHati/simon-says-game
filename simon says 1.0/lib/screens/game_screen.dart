import 'package:flutter/material.dart';
import 'package:simon_says/providers/light_sequene_provider.dart';
import 'package:simon_says/widgets/buttons_widget.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            const SizedBox(height: 20),

            Row(
              children: [
                const SizedBox(width: 615),

                Text(
                  "Level ${context.watch<LightSequenceProvider>().currentLevel}",
                  style: TextStyle(fontSize: 80, color: Colors.white),
                ),
                const Spacer(),

                ElevatedButton(
                  onPressed: context.read<LightSequenceProvider>().startGame,
                  child: Text("Start"),
                ),

                const SizedBox(width: 40,)
              ],
            ),

            const SizedBox(height: 70),

            ButtonsWidget(),
          ],
        ),
      ),
    );
  }
}
