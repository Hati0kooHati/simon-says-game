import 'package:flutter/material.dart';
import 'package:simon_says/screens/game_screen.dart';

class SimonSays extends StatelessWidget {
  const SimonSays({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameScreen(),
    );
  }
}