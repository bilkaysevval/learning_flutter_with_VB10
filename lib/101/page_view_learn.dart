import 'package:flutter/material.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({Key? key}) : super(key: key);

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {

  final _pageController = PageController(viewportFraction: 0.85);
  int _currentIndex = 10;
  void _updatePage(int index){
    setState(() {
      _currentIndex = index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(_currentIndex.toString()),
            ),
            const Spacer(),
            FloatingActionButton(onPressed: () {
              _pageController.previousPage(duration: _DurationUtility._lowDuration, curve: Curves.linear);
            }, child: const Icon(Icons.chevron_left)),
            FloatingActionButton(onPressed: () {
              _pageController.nextPage(duration: _DurationUtility._lowDuration, curve: Curves.linear);
            }, child: const Icon(Icons.chevron_right)),
          ],
        ),
      appBar: AppBar(),
      body: PageView(
//        padEnds: false, // this line leaves a gap at first page's beginning
        controller: _pageController,  // this line allows you to preview which page on next
        onPageChanged: _updatePage,
        children: [
          Container(color: Colors.brown.shade200,),
          Container(color: Colors.brown.shade400,),
          Container(color: Colors.brown.shade600,)
        ],
      ),
    );
  }
}

class _DurationUtility {
  static const _lowDuration = Duration(seconds: 1);
}