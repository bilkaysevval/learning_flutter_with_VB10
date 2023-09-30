import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({Key? key}) : super(key: key);

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(
            context: context,
            barrierDismissible: true, // so user cannot close the dialog by touching anywhere on the screen
            // user must choose button
            builder: (context) {
              return const _ImageZoomDialog();
            });
      }),
      appBar: AppBar(),
    );
  }
}

// different from at line 60
class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Version update!'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text('Update2'),
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'))
      ],
    );
  }
}

class Keys {
  static const versionUpdate = 'Version update';
}

// it is useful using like this instead of extending stateless widget
class UpdateDialog extends AlertDialog {
  UpdateDialog({Key? key, required BuildContext context})
      : super(
    key: key,
    title: const Text(Keys.versionUpdate),
    actions: [
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context, true);
        },
        child: const Text('Update2'),
      ),
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Close'))
    ],
  );
}
// for seeing zoomed the little sized picture
class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog({
    Key? key,
  }) : super(key: key);
  final String _url = 'https://picsum.photos/200';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: InteractiveViewer( // for zooming exc.
        child: Image.network(
          _url,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.6,
        ),
      ),
    );
  }
}