import 'package:flutter/material.dart';

const double kZero = 0; // for false

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({Key? key}) : super(key: key);

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

// we added ticket provider because we used vsync at line 18
class _AnimatedLearnViewState extends State<AnimatedLearnView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: _DurationItems.durationLow);
  }

  bool _isVisible = false;
  bool _isOpacity = false;
  // Text('data', style: context.textTheme().headline1)

  late AnimationController
      controller; // if it is late then must be defined in initstate

  void _changeVisible() {
    // start animation or rewind animation
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _placeHolderWidget(), // defined at line 103
      ),
      floatingActionButton: FloatingActionButton(
        // for controloling animate
        onPressed: () {
          _changeVisible();
          controller.animateTo(
              _isVisible ? 1 : 0); // for animating icon by using button
        },
      ),
      body: Column(
        children: [
          ListTile(
            // children 1
            title: AnimatedOpacity(
                duration: _DurationItems.durationLow,
                opacity: _isOpacity ? 1 : 0,
                child: const Text('data')),
            trailing: IconButton(
                onPressed: () {
                  _changeOpacity();
                },
                icon: const Icon(Icons.precision_manufacturing_rounded)),
          ),
          AnimatedDefaultTextStyle(
              // children 2
              style: (_isVisible
                      ? context.textTheme().displayLarge
                      : context
                          .textTheme()
                          .titleMedium) ?? // context can return null so if it returns null then TextStyle() will be called
                  const TextStyle(),
              duration: _DurationItems.durationLow,
              // children 2
              child: const Text('data')),
          AnimatedIcon(
            // children 3
            icon: AnimatedIcons.menu_close,
            progress: controller,
          ),
          AnimatedContainer(
            // children 4
            duration: _DurationItems.durationLow,
            height: _isVisible
                ? kZero
                : MediaQuery.of(context).size.width *
                    0.2, // for using screens %29
            width: MediaQuery.of(context).size.height * 0.2,
            color: _isVisible ? Colors.blue : Colors.purpleAccent,
            margin: const EdgeInsets.all(5),
          ),
          const Expanded(
              // children 5
              child: Stack(
            children: [
              AnimatedPositioned(
                  // it changes its position animated
                  top: 10,
                  curve: Curves.elasticOut,
                  duration: _DurationItems.durationLow,
                  child: Text('data'))
            ],
          )),
          Expanded(
            // children 6
            child: AnimatedList(itemBuilder: (context, index, animation) {
              // it is usable when adding or deleting smth from list
              return const Text('data');
            }),
          )
        ],
      ),
    );
  }

  AnimatedCrossFade _placeHolderWidget() {
    // turned the widget into a method for not to rewrite it
    return AnimatedCrossFade(
      // this widget allows us to switch between to widgets
      firstChild: const Placeholder(),
      secondChild: const SizedBox.shrink(),
      duration: _DurationItems.durationLow,
      crossFadeState:
          _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

//we can write this extension for not rewriting Theme.of(context).blablaa each time.
// in this way we can create our theme and use it in anywhere. you dont have to copy it each time
extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  // for not rewriting all durations. we can use this in all project. (line 107)
  static const durationLow = Duration(seconds: 1);
}
