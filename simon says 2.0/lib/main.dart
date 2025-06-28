import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simon_says/providers/light_sequene_provider.dart';
import 'package:simon_says/simon_says.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LightSequenceProvider(),
      child: const SimonSays(),
    ),
  );
}
