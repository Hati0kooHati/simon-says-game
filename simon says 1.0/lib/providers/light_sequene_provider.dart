import 'dart:math';

import 'package:flutter/material.dart';

class LightSequenceProvider with ChangeNotifier {
  final Random random = Random();

  final List<Color> buttonColors = [
    const Color.fromARGB(100, 0, 0, 255),
    const Color.fromARGB(100, 255, 230, 0),
    const Color.fromARGB(100, 0, 255, 0),
    Color.fromARGB(100, 255, 0, 0),
  ];

  final List<Color> buttonColorsSplash = [
    const Color.fromARGB(255, 0, 0, 255),
    const Color.fromARGB(255, 255, 230, 0),
    const Color.fromARGB(255, 0, 255, 0),
    Color.fromARGB(255, 255, 0, 0),
  ];

  final List<Color> buttonColorsDefault = [
    const Color.fromARGB(100, 0, 0, 255),
    const Color.fromARGB(100, 255, 230, 0),
    const Color.fromARGB(100, 0, 255, 0),
    Color.fromARGB(100, 255, 0, 0),
  ];

  late final List<int> lightSequence = [random.nextInt(4)];
  int currLightIndex = 0;
  int currentLevel = 1;

  Future<Null> showLight({
    required final int index,
    required final int delayMilliseconds,
  }) async {
    clearLightSplashes();
    buttonColors[index] = buttonColorsSplash[index];

    notifyListeners();

    await Future.delayed(Duration(milliseconds: delayMilliseconds), () {
      buttonColors[index] = buttonColorsDefault[index];
      notifyListeners();
    });

    return;
  }

  void clearLightSplashes() {
    for (int index = 0; index + 1 != buttonColors.length; index++) {
      buttonColors[index] = buttonColorsDefault[index];
    }
  }

  void clearData() {
    currentLevel = 1;
    currLightIndex = 0;
    lightSequence.clear();
    lightSequence.add(random.nextInt(4));
  }

  void startGame() {
    clearData();
    showLightsSequence();
    notifyListeners();
  }

  void addNewLight() {
    lightSequence.add(random.nextInt(4));
  }

  void checkLightSequence({required final int tappedIndex}) async {
    if (tappedIndex == lightSequence[currLightIndex]) {
      currLightIndex++;
    } else {
      buttonColors[tappedIndex] = buttonColorsDefault[tappedIndex];
      clearData();
    }

    if (currLightIndex != 0 && currLightIndex == lightSequence.length) {
      currentLevel++;
      currLightIndex = 0;

      // clearLightSplashes();

      addNewLight();

      await Future.delayed(Duration(milliseconds: 1500));
      // showLight(index: lightSequence.last, delayMilliseconds: 1000);
      showLightsSequence();
    }

    notifyListeners();
  }

  void showLightsSequence() async {
    for (final int index in lightSequence) {
      await showLight(index: index, delayMilliseconds: 1000);
      notifyListeners();
    }
  }
}
