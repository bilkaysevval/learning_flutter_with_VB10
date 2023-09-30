import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            margin: ProjectMargins.cardMargin,
            color: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const SizedBox(
                height: 100,
                width: 300,
                child: Center(
                  child: Text('sevval'),
                )),
            //shape: StadiumBorder(),
          ),
          Card(
            elevation: 100,
            color: Theme.of(context).colorScheme.error,
            child: const SizedBox(width: 100, height: 100),
          ),
          _CustomCard(
              child: const SizedBox(
            // we created this widget with class _CustomCard
            height: 100,
            width: 300,
            child: Center(
              child: Text('hey you'),
            ),
          ))
        ],
      ),
    );
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
}

class _CustomCard extends StatelessWidget {
  _CustomCard({super.key, required this.child});
  final Widget child;
  final roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: ProjectMargins.cardMargin,
      shape: roundedRectangleBorder,
      child: child,
    );
  }
}
