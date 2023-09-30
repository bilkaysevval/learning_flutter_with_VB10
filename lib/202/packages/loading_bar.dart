import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({super.key, this.size, this.color});
  final double? size;
  final _defaultSize = 40.0;
  final Color? color;
  final _defaultColor = Colors.deepPurpleAccent;

  @override
  Widget build(BuildContext context) {
    return SpinKitSquareCircle(
      color: color ?? _defaultColor,
      size: size ?? _defaultSize,
    );
  }
}
