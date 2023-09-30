import 'package:flutter/material.dart';
import 'package:learning/product/constant/duration_items.dart';
import 'package:learning/product/constant/lottie_items.dart';
import 'package:learning/product/global/theme_notifier.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn>  with TickerProviderStateMixin{
  late AnimationController controller;
  bool isLightTheme = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: DurationItems.durationNormal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () async {
              // controller.animateTo(0.5);
              await controller.animateTo(isLightTheme ? 0.5 : 1);
              isLightTheme = !isLightTheme ;
              Future.microtask(() { // using for waiting until precious process done
                context.read<ThemeNotifier>().changeTheme();
              });
            },
            child: Lottie.asset(
              LottieItems.changeTheme.lottiePath,
              repeat: false,
              controller: controller,
              )),
        ],
      ),
      body: const _LoadingLottie()
    );
  }
}

class _LoadingLottie extends StatelessWidget {
  const _LoadingLottie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.network(LottieLinks().aestheticLoading));
  }
}

// first use
class LottieLinks {
  final rectangleLoading = 'https://lottie.host/55c1c1e0-cde9-458c-be0a-c943091135ca/0F8m0Usm2X.json';
  final aestheticLoading = 'https://lottie.host/5ce03b91-a2a3-4e30-90b3-6e62539cf6aa/p8aq8yFa7w.json';
  final astronaut = 'astronaut.json';
  final changeTheme = 'change_theme.json';
}