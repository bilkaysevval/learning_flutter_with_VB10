import 'package:flutter/material.dart';

class RandomImage extends StatelessWidget {
  const RandomImage({Key? key, this.height = 100}) : super(key: key);  // this means if user dont give us height then it will be 100
  final imageUrl = 'https://picsum.photos/200/300';
  final double height;
  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl, height: height, fit: BoxFit.cover,);
  }
}
