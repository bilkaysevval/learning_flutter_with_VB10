import 'package:flutter/material.dart';
import 'package:learning/101/app_bar.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(   // it allows us to position over and over
        children: [
          Positioned.fill(   // it fills all area
              top: 20,
              child: Container(
                color: Colors.pinkAccent.shade100,
              )),
          Container(
            color: Colors.lightBlue,
            height: 120,
          ),
          Padding(  // we can position widgets with padding over and over
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              color: Colors.deepPurpleAccent,
              height: 40,
            ),
          ),
          Positioned(  //  like padding but by compressing itself in area
              bottom: 0,
              height: 100,
              width: 25,
              child: Container(
                color: Colors.teal,
              )),
        ],
      ),
    );
  }
}
