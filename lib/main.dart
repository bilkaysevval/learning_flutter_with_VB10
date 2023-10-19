import 'package:flutter/material.dart';

import '202/animated_learn_view.dart';

void main() {
  runApp(const MyApp());
}

// THIS MAIN CLASS FOR USING PROVIDER

// void main() {
//   runApp(MultiProvider(providers: [
//     Provider(create: (_) => ResourceContext()),
//     ChangeNotifierProvider<ThemeNotifer>(create: (context) => ThemeNotifer())
//   ],
//     builder: (context, child) => const MyApp(),
//   ));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: ProjectItems.projectName,
      // theme: LightTheme().theme, // it's our theme file
      //theme: context.watch()<ThemeNotifier>().currentTheme, // THIS IS FOR USING PROVIDER
      // theme: ThemeData.light().copyWith(
      //     tabBarTheme: TabBarTheme(
      //       // we can give tabbar theme in here for using in all of the project
      //       labelColor: Colors.blue.shade300,
      //       unselectedLabelColor: Colors.pinkAccent.shade100,
      //       indicatorColor: Colors.blue.shade300,
      //       indicatorSize: TabBarIndicatorSize.label,
      //     ),
      //     progressIndicatorTheme:
      //         const ProgressIndicatorThemeData(color: Colors.green),
      //     listTileTheme:
      //         const ListTileThemeData(contentPadding: EdgeInsets.zero),
      //     cardTheme: CardTheme(
      //       shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(
      //               20)), // we can give in there for using this shape for all our app
      //     ),
      //     appBarTheme: const AppBarTheme(
      //       toolbarHeight: 80,
      //       centerTitle: true,
      //       backgroundColor: Colors.white30,
      //       // systemOverlayStyle: SystemUiOverlayStyle.light,
      //       elevation: 0,
      //     )),
      home: AnimatedLearnView(),
    );
  }
}
