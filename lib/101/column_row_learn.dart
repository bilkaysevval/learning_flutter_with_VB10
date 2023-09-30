import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(flex:4, child: Container(color: Colors.deepPurpleAccent,)),   // we can only use Expanded within Column or Row
          Expanded(flex:2, child: Container(color: Colors.teal,)),   // we can use flex for dividing the page into percentages(%)
          Expanded(flex:1, child: Container(color: Colors.grey,)),
          const Expanded(flex:3, child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,  // positioning horizontally
            crossAxisAlignment: CrossAxisAlignment.center,    // positioning vertically
            mainAxisSize: MainAxisSize.max,   // if its min then the component will only position as its size, max is default
            children: [
              Text('a'),
              Text('bb'),
              Text('ccc'),
              // Expanded(flex:3, child: Container(color: Colors.lightBlue.shade100)),
              // Expanded(flex:2, child: Container(color: Colors.lightBlue.shade400,)),
              // Expanded(flex:4, child: Container(color: Colors.lightBlue.shade700,)),
            ],
          )),
        ],
      ),
    );
  }
}
