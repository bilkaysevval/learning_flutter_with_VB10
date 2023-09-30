import 'package:flutter/material.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [CenterCircularWhiteProgress()],  // we can also use in here
      ),
      body: const Center(
        child: LinearProgressIndicator(  // we can see this widget on AppBar generally
          color: Colors.deepPurpleAccent,
        ),
      ),
    );
  }
}

class CenterCircularWhiteProgress extends StatelessWidget {  // If we do not want the theme to change on every page, it would be effective to do it in the main dart
  const CenterCircularWhiteProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(
      // color: Colors.white,  // i deleted this for working with main.dart
      strokeWidth: 8,
      value: 0.7,
      backgroundColor: Colors.amber,
    ));
  }
}
