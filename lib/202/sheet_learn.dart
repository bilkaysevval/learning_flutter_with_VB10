
// sheets are little screens that appear on page. they can be on center, at the bottom(snack bar) or sliding from at the bottom
// veli bacik's sheet file --->
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learning/core/random_image.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> {

  Color _backgroundcolor = Colors.lightBlue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _backgroundcolor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          //write show for sheet properties
          final result = await showModalBottomSheet(context: context,
            backgroundColor: Colors.orangeAccent,
            barrierColor: Colors.transparent,
            // if we want to make it custom then it must be true. because if it is true then it will cover the whole page
            // and wrap with column and sized box. give it size what you want with MediaQuery
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            isScrollControlled: true,
            builder: (context) {
              return const _CustomSheet();
            },
          );
          // inspect(result); // for seeing results type
          if (result is bool) {
            setState(() {
              _backgroundcolor = Colors.deepPurpleAccent;
            });
          }
        },
        child: const Icon(Icons.share),
      ),
    );
  }
}


// if there is a setState function in a widget, it cannot be extracted
// because when we extract widget it will be stateless bu setState can be in Stateful widget
// so make this widget stateful
class _CustomSheet extends StatefulWidget {
  const _CustomSheet({
    super.key,
  });

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {

  final _gripHeight = 30.0;
  @override
  Widget build(BuildContext context) {
    return Padding( // we can wrap with SafeArea
      padding: const EdgeInsets.only(top: 10),
      child: Column( // if we dont wrap with column it will be snack bar at the bottom
        mainAxisSize: MainAxisSize.min, // in this way, image will be located at the bottom(snack bar)
        children: [
          SizedBox(
            height: _gripHeight,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Divider(
                  color: Colors.black26,
                  thickness: 3,
                  indent: MediaQuery.of(context).size.width * 0.2,
                  endIndent: MediaQuery.of(context).size.width * 0.2,
                ),
                Positioned(
                    right: 10,
                    top: 0,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.close),
                      ),
                    ))
              ],
            ),
          ),// trailing empty space
          const RandomImage(height: 400),
          ElevatedButton(onPressed: () {
            // but we closed context. it will cause some problems in project
            // we should not try to access from trailing context to above context
            // we can create another widget for preventing this situation
            setState(() {
            });
            Navigator.of(context).pop<bool>(true); // closes the sheet returns true which is bool type
          }, child: const Text('OK'))// our randomImage widget
        ],
      ),
    );
  }
}

mixin ProductSheetMixin {
  void customSheet(BuildContext context){
    showModalBottomSheet(context: context,
      backgroundColor: Colors.orangeAccent,
      barrierColor: Colors.transparent,
      // if we want to make it custom then it must be true. because if it is true then it will cover the whole page
      // and wrap with column and sized box. give it size what you want with MediaQuery
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      isScrollControlled: true,
      builder: (context) {
        return const _CustomSheet();
      },
    );
  }
}