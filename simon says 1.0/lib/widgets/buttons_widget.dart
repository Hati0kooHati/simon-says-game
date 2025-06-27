import 'package:flutter/material.dart';
import 'package:simon_says/widgets/single_button_widget.dart';

class ButtonsWidget extends StatefulWidget {
  const ButtonsWidget({super.key});

  @override
  State<ButtonsWidget> createState() => _ButtonsWidgetState();
}

class _ButtonsWidgetState extends State<ButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleButtonWidget(color: const Color.fromARGB(255, 13, 27, 145), index: 0,),
            SingleButtonWidget(color: const Color.fromARGB(255, 134, 121, 7), index: 1,),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleButtonWidget(color: const Color.fromARGB(255, 3, 81, 47), index: 2,),
            SingleButtonWidget(color: const Color.fromARGB(255, 155, 15, 4), index: 3,),
          ],
        ),
      ],
    );
  }
}
