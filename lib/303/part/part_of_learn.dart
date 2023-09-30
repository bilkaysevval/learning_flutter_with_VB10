import 'package:flutter/material.dart';

part 'part_appbar.dart'; // for main class

class PartofLearn extends StatefulWidget {
  const PartofLearn({Key? key}) : super(key: key);

  @override
  State<PartofLearn> createState() => _PartofLearnState();
}

class _PartofLearnState extends State<PartofLearn> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _PartofAppBar(),
      body: Text('data'),
    );
  }
}