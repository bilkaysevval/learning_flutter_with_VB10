import 'package:flutter/material.dart';

class ColorLearnView extends StatelessWidget {
  const ColorLearnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          color: ColorsItems.porsche,
          child: const Text('data')),
    );
  }
}


class ColorsItems {
  static const Color porsche = Color(0xffEDBF61);
}