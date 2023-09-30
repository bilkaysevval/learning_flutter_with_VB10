import 'package:flutter/material.dart';
import 'package:learning/core/random_image.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({Key? key}) : super(key: key);
  final _cardsHeight = 50.0;
  final _cardWidth = 200.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(flex: 4, child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(bottom: _cardsHeight / 2, child: const RandomImage(),),   // we pushed up the image to card's height
              Positioned(
                  height: _cardsHeight,  // card's height
                  width: _cardWidth,
                  // right: 0,
                  // left: 0,
                  bottom: 0,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

                  )),
            ],
          ),),
          const Spacer(flex: 6,),
        ],
      ),
    );
  }
}
