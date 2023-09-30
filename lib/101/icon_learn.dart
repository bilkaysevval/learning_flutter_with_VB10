import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  const IconLearnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('hey you')),
      body: Column(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.messenger_outline_outlined,
                //color: IconColors().froly,
                color: Theme.of(context).colorScheme.error,
                size: IconSize().iconMedium))
        ],
      ),
    );
  }
}

class IconSize {
  final double iconSmall = 40;
  final double iconMedium = 60;
  final double iconLarge = 80;
}

class IconColors {
  final Color froly = const Color(0xffED617A);
}
