import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({Key? key}) : super(key: key);

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          // we can add what we want. its height is infinite
          children: [
            FittedBox(
              // it compresses the text fit into screen width
              child: Text(
                'hello',
                style: Theme.of(context).textTheme.headlineLarge,
                maxLines: 1,
              ),
            ),
            Container(
              color: Colors.brown.shade200,
              height: 300,
            ),
            const Divider(),
            SizedBox(
              height: 300,
              child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection:
                      Axis.horizontal, // it allows us to horizontal listview
                  children: [
                    Container(
                      color: Colors.brown.shade100,
                      width: 100,
                    ),
                    Container(
                      color: Colors.brown.shade200,
                      width: 100,
                    ),
                    Container(
                      color: Colors.brown.shade300,
                      width: 100,
                    ),
                    Container(
                      color: Colors.brown.shade400,
                      width: 100,
                    ),
                    Container(
                      color: Colors.brown.shade500,
                      width: 100,
                    ),
                    Container(
                      color: Colors.brown.shade200,
                      height: 300,
                    ),
                  ]),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
            // const Demo(),   // for understanding the code above
            Container(
              color: Colors.brown.shade200,
              height: 300,
            ),
            Container(
              color: Colors.brown.shade200,
              height: 300,
            ),
          ],
        ));
  }
}

// class Demo extends StatefulWidget {
//   const Demo({Key? key}) : super(key: key);
//
//   @override
//   State<Demo> createState() => _DemoState();
// }
//
// class _DemoState extends State<Demo> {
//
//
//   @override
//   void initState() {   // this line runs when we reach the bottom of listView because we add the Demo() at the end of it
//     super.initState();
//
//     print('enter');
//   }
//
//   @override
//   void dispose() {   // this line runs when we reach the exit from listView's bottom
//     super.dispose();
//
//     print('exit');
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
