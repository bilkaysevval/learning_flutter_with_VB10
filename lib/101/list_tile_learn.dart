import 'package:flutter/material.dart';
import 'package:learning/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: ListTile(  // list tile should be used with wrapped with Card
              title: const RandomImage(height: 135,),
              // dense: true,
              contentPadding: EdgeInsets.zero,
              onTap: (){},
              subtitle: const Text('thisissubtitle'),
              leading: const Icon(Icons.book_outlined),
              trailing: Container(
                width: 20,
                color: Colors.teal,
                child: const SizedBox(width: 20, child: Icon(Icons.chevron_right),),
              ),
            ),
          )
      ],),
    );
  }
}
