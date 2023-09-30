import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SpinKitSquareCircle(
        color: Colors.white,
        size: 50.0,
        controller: AnimationController(
            vsync: this, duration: const Duration(milliseconds: 1200)),
      ), // if 'vsync', then we must do 'with'
    );
  }
}
