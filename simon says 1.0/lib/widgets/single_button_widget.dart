import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simon_says/providers/light_sequene_provider.dart';

class SingleButtonWidget extends StatelessWidget {
  const SingleButtonWidget({
    super.key,
    required this.color,
    required this.index,
  });

  final int index;
  final Color color;

  void onButtonTap() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<LightSequenceProvider>().showLight(
          index: index,
          delayMilliseconds: 500,
        );

        context.read<LightSequenceProvider>().checkLightSequence(
          tappedIndex: index,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.watch<LightSequenceProvider>().buttonColors[index],
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(4),
        height: 250,
        width: 250,
      ),
    );
  }
}
