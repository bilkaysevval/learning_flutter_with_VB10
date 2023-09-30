import 'package:flutter/material.dart';
import 'package:learning/core/random_image.dart';

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  // second code
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // for adding spesific number of elements
      itemBuilder: (context, index) {
        print(index);
        return SizedBox(
          // we wrapped the Column widget with SizedBox because we dont want to load all of the elements at once
          height:
              100, // if we give height to sizedbox it will load only when we scroll up the page
          child: Column(
            children: [
              const Expanded(
                  // we wrapped this with Expanded for arranging the indexes and the photos
                  child: RandomImage()),
              Text(
                '$index',
                style: Theme.of(context).textTheme.headlineLarge,
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          color: Colors.lime,
        );
      },
      itemCount: 10,
    );
  }
}

// class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {   // first code
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(itemBuilder: (context, index) {
//       print(index);
//       return Column(
//         children: [
//           const Placeholder(
//             color: Colors.pink,
//           ),
//           Text('$index'),
//         ],
//       );
//     },);
//   }
// }
