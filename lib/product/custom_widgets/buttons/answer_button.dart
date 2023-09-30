import 'dart:math';

import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton({super.key, this.onNumber});
  final bool Function(int number)? onNumber; // for getting data from main class
  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  Color? _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: _backgroundColor),
      onPressed: () {
        final result = Random().nextInt(10); // it returns a random number for each pressing to the button
        final response = widget.onNumber?.call(result) ?? false; // for returning back the number
        setState(() {
          _backgroundColor = response ? Colors.green : Colors.red;
        });
    }, child: const Text('data'));
  }
}
