import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

//  CupertinoApp for IOS but we can always use MaterialApp

class ContainerSizedBoxLearn extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Text('a' * 500),
          ),
          const SizedBox.shrink(),
          SizedBox.square(
            dimension: 50,
            child: Text('b' * 50),
          ),
          Container(
            //width: 50,
            //height: 50,
            //color: Colors.deepOrange, // if we use decoration like at line 30, we cannot write this line
            constraints: const BoxConstraints(maxWidth: 100, minWidth: 40, maxHeight: 100, minHeight: 65),  // we should define width and height like this line instead of directly assigning width and height
            child: Text('cc' * 30),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: ProjectUtility.boxDecoration,
          ),
        ],
      ),
    );
  }
}

class ProjectUtility {  // if we use these properties more than once we can create a class like that or like as follows
  static BoxDecoration boxDecoration = BoxDecoration(
    //color: Colors.green,
    boxShadow: const [BoxShadow(color: Colors.red, offset: Offset(0.1, 2), blurRadius: 12,)],
    borderRadius: BorderRadius.circular(20),
    gradient: LinearGradient(colors: [Colors.amberAccent, Colors.cyan]),
    //shape: BoxShape.circle,
    border: Border.all(color: Colors.white, width: 10)
  );
}


class ProjectContainerDecoration extends BoxDecoration{
  ProjectContainerDecoration()
      :super(
      //color: Colors.green,
      boxShadow: const [BoxShadow(color: Colors.red, offset: Offset(0.1, 2), blurRadius: 12,)],
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(colors: [Colors.amberAccent, Colors.cyan]),
      //shape: BoxShape.circle,
      border: Border.all(color: Colors.white, width: 10)
    );
}








