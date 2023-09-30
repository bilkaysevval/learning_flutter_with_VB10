import 'package:flutter/material.dart';
import 'package:learning/product/language_items.dart';

import '../product/counter_hello_button.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({Key? key}) : super(key: key);

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  int _countValue = 0;

  //int _counterCustom = 0;
  // void incrementValue(){
  //   setState(() {
  //     _countValue++;
  //   });
  // }
  // void deincrementValue(){
  //   setState(() {
  //     _countValue--;
  //   });
  // }
  // we must write like as follows for code readibility

  void _updateCounter(bool incordec) {
    if (incordec) {
      _countValue++;
    } else {
      _countValue--;
    }
    setState(() {}); // if we write some codes into setState() function, then it will trigger the build function and the value will change to current data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(LanguageItems.welcomeTitle)),   // we should create a class which name is LanguageItems, for gathering all strings in it and use like this
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min, // for carrying buttons to right
        children: [
          _incrementButton(),
          _deincrementButton(),
        ],
      ),
      body: Column(
        children: [
          Center(child: Text(_countValue.toString(), style: Theme
              .of(context)
              .textTheme
              .headlineLarge,)),
          const Placeholder(),
          // ElevatedButton(onPressed: () {     // in this place, we recall increment and deincrement button's function which we dont need. we only need to call this button's onpressed
          //   setState(() {                    //if we write like this(in with other codes), every pushing the button that we will call the print in deincrement function because build function will be called every time entirely
          //     ++_counterCustom;              // so we have to create another file for only writing this button's action so we only call what we need (in product directory)
          //   });
          // }, child: Text('merhaba $_counterCustom')),
          const CounterHelloButton(),
          // we created the CounterHelloButton statefull widget in another file and gave here then print line never called
        ],
      ),
    );
  }

  FloatingActionButton _deincrementButton() {
    print('deincrement');
    return FloatingActionButton(onPressed: () {
      _updateCounter(false);
    }, child: const Icon(Icons.remove),);
  }

  Padding _incrementButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: FloatingActionButton(onPressed: () {
        _updateCounter(true);
      }, child: const Icon(Icons.add),),
    );
  }
}
