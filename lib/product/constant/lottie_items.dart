enum LottieItems { changeTheme }
// second use
extension LottieItemsExtension on LottieItems {
  String _path() {
    switch (this) {
      case LottieItems.changeTheme:
        return 'change_theme';
    }
  }

  String get lottiePath => 'assets/lotties/${_path()}.json';
}