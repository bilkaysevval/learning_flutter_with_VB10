import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(  // we should not write like these lines so we have to add the Padding widget to body widget and give its structures
            // then we can add the widgets we want to add to Padding's child's
            padding: ProjectPadding.pagePaddingAll,
            child: Container(color: Colors.white, height: 200),
          ),
          Container(color: Colors.deepOrangeAccent, height: 2),
          Padding(
            padding: ProjectPadding.pagePaddingVertical,
            child: Container(color: Colors.green, height: 200),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 200) + const EdgeInsets.symmetric(vertical: 50), // we can combine two padding like that
            child: const Text('sevval'),
          ),
        ],
      ),
    );
  }
}

class ProjectPadding {  // we can create a class for same structures then we cannot have to rewrite everywhere for code's effectivity
  static const pagePaddingVertical = EdgeInsets.symmetric(horizontal: 10, vertical: 30);
  static const pagePaddingAll = EdgeInsets.all(10);
}


