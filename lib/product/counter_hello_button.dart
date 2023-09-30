import 'package:flutter/material.dart';
import 'package:learning/product/language_items.dart';

class CounterHelloButton extends StatefulWidget {
  const CounterHelloButton({Key? key}) : super(key: key);

  @override
  State<CounterHelloButton> createState() => _CounterHelloButtonState();
}

class _CounterHelloButtonState extends State<CounterHelloButton> {
  int _counterCustom = 0;
  //final String _welcomeTitle = 'hello';    // we used the welcomeTitle variable in LanguageItems class

  void _updateCounter(){
    setState(() {
      ++_counterCustom;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: _updateCounter, child: Text('$LanguageItems.welcomeTitle $_counterCustom', style: Theme.of(context).textTheme.bodyLarge,));
  }
}
