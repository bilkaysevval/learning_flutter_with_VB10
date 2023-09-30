import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(onPressed: () {
            // create process that what you want
          }, child: const Text('text button') ),  // we can give any widget at child
          TextButton(onPressed: () {},
              style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {  // in here; we used ButtonStyle which has no guideline. so we must create a guideline with MaterialStateProperty
                // but if we use other buttons like elevated, icon or outlined button, then we don't have to create guideline 'cause it has own guideline by default ---> at line 23 we can use styleFrom
                if(states.contains(MaterialState.pressed)){   // we can change the color if the button is pressed
                  return Colors.green;
                }
                else {
                  return Colors.red;
                }
              })), child: Text('save', style: Theme.of(context).textTheme.bodyMedium)),
          OutlinedButton(onPressed: () {}, style: OutlinedButton.styleFrom(backgroundColor: Colors.amberAccent,padding: const EdgeInsets.all(50) ,shape: const CircleBorder()) ,child: const Text('outlined button') ),
          ElevatedButton(onPressed: () {}, child: const Text('elevated button')), // if we set onPressed: null, then this button will be unable by default like as follows
          const ElevatedButton(onPressed: null, child: Text('elevated button')),
          IconButton(onPressed: () {}, icon: const Icon(Icons.abc_rounded)),  // icon widget wants a icon variable
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.plus_one_rounded)),  // we can see Icons' pictures when on it by clicking ctrl+space
          OutlinedButton(onPressed: () {}, child: const Text('outlined button')),  // if we want to add widht or height then we have to wrap this button with sizedbox
          const Text('text'),
          InkWell(onTap: () {}, child: const Text('inkwell')),
          const SizedBox(height: 20,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
            onPressed: () {}, child: Padding(
            padding: const EdgeInsets.only(top:20, bottom: 20, right: 40, left: 40),
            child: Text('Place Bid', style: Theme.of(context).textTheme.headlineMedium),
          ),),
        ],
      ),
    );
  }
}
