import 'package:flutter/material.dart';

class ColorDemosView extends StatefulWidget {
  const ColorDemosView({Key? key, required this.initialColor}) : super(key: key);
  final Color? initialColor;
  @override
  State<ColorDemosView> createState() => _ColorDemosViewState();
}

class _ColorDemosViewState extends State<ColorDemosView> {

  Color? _backgroundColor;

  @override
  void initState() {
    super.initState();
    _backgroundColor = Colors.brown.shade200;   // we write this line in initstate because initstate runs before build
  }

  @override
  void didUpdateWidget(covariant ColorDemosView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if(widget.initialColor != _backgroundColor && widget.initialColor != null){
      changeBackgroundColor(widget.initialColor!);
    }
  }

  void changeBackgroundColor(Color color){
    setState(() {  // if we want to change smt on screen we must use setState
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor ,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _colorOnTap,
          items: [
        BottomNavigationBarItem(icon: _ColorContainers(color: _ColorsUtility().blueGrey), label: 'blueGrey'),
        BottomNavigationBarItem(icon: _ColorContainers(color: _ColorsUtility().purple,), label: 'purple'),
        BottomNavigationBarItem(icon: _ColorContainers(color: _ColorsUtility().indigo,), label: 'indigo'),
      ]),
    );
  }

  void _colorOnTap(int value) {
          if(value == _MyColors.blueGrey.index){changeBackgroundColor(_ColorsUtility().blueGrey);}
          else if(value == _MyColors.purple.index){changeBackgroundColor(_ColorsUtility().purple);}
          else if(value == _MyColors.indigo.index){changeBackgroundColor(_ColorsUtility().indigo);}
        }
}

class _ColorContainers extends StatelessWidget {
  const _ColorContainers({super.key, required this.color,});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      color: color,);
  }
}

class _ColorsUtility {
  final Color blueGrey = Colors.blueGrey;
  final Color purple = Colors.deepPurpleAccent;
  final Color indigo = Colors.indigo;
}

enum _MyColors { blueGrey, purple, indigo }
