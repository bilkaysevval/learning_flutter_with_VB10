import 'package:flutter/material.dart';
import 'container_sized_box_learn.dart';

class ScaffoldLearnView extends StatelessWidget{
  const ScaffoldLearnView({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('scaffold samples')),
      body: Text('hey you!'),
      backgroundColor: Colors.blueGrey,
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(context: context, builder: (context) => Container(
          height: 100,
          child: Text('anyway'),
        ),);
      },),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: const Drawer(),
      bottomNavigationBar: Container(
        height: 150,
        decoration: ProjectContainerDecoration(),  // this decoration type is our last class's(in container_sized_box_learn file) decoration variable
        child: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'bar1'),
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'bar2'),
        ]),
      ),
    );
  }
}



