import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  const TextLearnView({Key? key}) : super(key: key);
  static const String name = 'sevval';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('welcome $name. your names length is ${name.length}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: ProjectStyle.welcomeStyle,
//              style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.yellow),
              ),
              Text(
                'hey this is second sentences!',
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: ProjectColors.WelcomeColor),
              ),

            ],
          )),
    );
  }
}

class ProjectStyle {  //for not rewriting all these style lines and refer that class like line 16
  static TextStyle welcomeStyle = const TextStyle(
      color: Colors.deepPurpleAccent,
      wordSpacing: 3,
      fontSize: 20,
      fontStyle: FontStyle.italic,
      decoration: TextDecoration.lineThrough);
}

// nullable herhangi bir degisken tanimlarsak ( final String? name = 'sevval'; ) , bunu kesinlikle Text( name! ); seklinde yapmayiz cunku nullable geldiginde sikinti cikarabilir. o yuzden Text ( name ??  ' ' ); seklinde yapariz.

// we shouldnt write Text sentences just like Text( ' sevval' ); , we must always define these texts in a class then write like Text( variable_name );

class ProjectKeys {  // if we want to just showing a text we have to do this class thing
  // define a ProjectKeys object above and then use it like Text(keys.welcome)
  final String welcome = 'hello';
}


class ProjectColors {
  static Color WelcomeColor = Colors.blueAccent;  // we can change the color like that easyly
}
















