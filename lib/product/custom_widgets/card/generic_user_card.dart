import '../../../303/generic_learn.dart';
import 'package:flutter/material.dart';

class GenericUserCard extends StatelessWidget {
  const GenericUserCard({Key? key, required this.model}) : super(key: key);
  final GenericUser model;
  @override
  Widget build(BuildContext context) {
    return Text(model.name);
  }
}