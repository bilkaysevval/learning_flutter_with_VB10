import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {  // for showing data
  const StatelessLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {  // build method is a place for creating widgets
    return Scaffold(
      body: Column(
        children: [
          // Text('hey you motherfucker',    // if we want to be effective, then we have to always do every single code in a widget like as follows
          // but the important thing is the data at line 27 must be static which means cannot be changeable by client
          // style: Theme.of(context).textTheme.bodyMedium,)
          const TitleTextWidget(),
          _emptySizedBox(),
          const TitleTextWidget(),
          const TitleTextWidget(),
          _emptySizedBox(),
          const TitleTextWidget(),
          const TitleTextWidget(),
          _emptySizedBox(),
          const _DecorationWidget(), // if we define a complex widget in here, we can extract it a widget as follows with refactor
          _emptySizedBox()
        ],
      ),
    );
  }

  SizedBox _emptySizedBox() => const SizedBox(height: 30,);  // extract method for easy things like that and use in Scaffold with methods name
}

class _DecorationWidget extends StatelessWidget {  // if we want this widget to be private for this file then we must add _
  const _DecorationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.red),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({Key? key, this.title}) : super(key: key);  // ---> required this.title
  final String? title; // this variable can be null but if we want it existing, then we must define as required like above

  @override
  Widget build(BuildContext context) {
    return Text('hey you',  // this line must be static. if we define this variable in this class then it must be nullable and final,then must be specified as key
    style: Theme.of(context).textTheme.displayMedium,);
  }
}

