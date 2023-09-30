import 'package:flutter/material.dart';
import 'oop_learn.dart';

class OOPLearnView extends StatefulWidget {
  const OOPLearnView({Key? key}) : super(key: key);

  @override
  State<OOPLearnView> createState() => _OOPLearnViewState();
}

class _OOPLearnViewState extends State<OOPLearnView> {
  FileDownload? download;

  @override
  void initState() {
    super.initState();
    download = FileDownload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          CircularProgressIndicator(
            color: Color.fromARGB(255, 129, 21, 57),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        download?.downloadItem(null);
      }),
    );
  }
}
