import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  const CustomWidgetLearn({Key? key}) : super(key: key);
  final String title = 'Food';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: _CustomElevatedButton(title: title,)),
    );
  }
}


class _ColorsUtility{  // if we want to sth that not exist in widgets library then we can create a class like that
  // and give all properties that you will use all project in it then add main class 'with'
  // and if we just add this 'with' to the relevant class, it makes easier our code legibility (like )
  final Color deep = Colors.deepOrange;
  final Color white = Colors.white;
}

// we want to create a custom elevated button in this class and using _ColorsUtility
class _CustomElevatedButton extends StatelessWidget implements _ColorsUtility{
  _CustomElevatedButton({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: deep,
              shape: const StadiumBorder()),
          onPressed: () {},
          child: Text(title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: white, fontWeight: FontWeight.bold)),
    );
  }

  @override
  // TODO: implement deep
  Color get deep => throw UnimplementedError();

  @override
  // TODO: implement white
  Color get white => throw UnimplementedError();
}
