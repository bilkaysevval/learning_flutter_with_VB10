import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({super.key, required this.title, required this.callback});
  final String title;
  final Future<void> Function() callback;

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;

  void _changeLoading(){
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
      onPressed: () async {
        _changeLoading();
        await widget.callback.call(); // waiting for main classes requests and calling this
        _changeLoading();
        },
      child: _isLoading ? const CircularProgressIndicator(color: Colors.white,) :
        Text(widget.title),);
  }
}
