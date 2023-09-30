import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({Key? key}) : super(key: key);
  final String _title = 'welcome learn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        // centerTitle: true,  // we wrote these lines at main appBar
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        // systemOverlayStyle: SystemUiOverlayStyle.light,  // status bar's color
        leading: const Icon(Icons.chevron_left), // this chevron_left button comes by default normally
        automaticallyImplyLeading: false, // by this line, we can do that chevron_left button do not comes automatically
        leadingWidth: 50,
        actionsIconTheme: const IconThemeData(color: Colors.yellow, size: 25),
        // toolbarTextStyle: const TextStyle(color: Colors.yellow),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.mark_email_unread_sharp)),
          const Center(child: CircularProgressIndicator())
        ],
      ),
      body: Column(children: const[]),
    );
  }
}
