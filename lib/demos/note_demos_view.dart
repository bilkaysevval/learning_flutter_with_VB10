import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning/101/image_learn.dart';

class NoteDemos extends StatelessWidget {
  const NoteDemos({Key? key}) : super(key: key);
  final _title = 'my note for you';
  final _description =
      "my first note is that i love you so much and i'm so thankful for having you, thank god. but i wonder if you don't love me today. i think you don't. do you ?";
  final _createNote = 'Click if you love me today';
  final _importNotes = "no, i don't because i'm abbah tubuke";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.brown.shade700,
      ),
      body: Padding(
        padding: PaddingItems().horizontalPadding,
        child: Column(
          children: [
            Padding(
              padding: PaddingItems().verticalPadding,
              child: PngImages(name: ImageItems().brownStickyNote),
            ), // we created this class in image_learn.dart
            _TitleWidget(title: _title),
            Padding(
              padding: PaddingItems().verticalPadding,
              child: _SubtitleWidget(description: _description),
            ),
            //Spacer(),
            // if we want to configure button's sizes then we have to wrap with sizedbox
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown.shade400,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  child: SizedBox(
                      height: 60,
                      child: Center(
                          child: Text(
                        _createNote,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.brown.shade50),
                      ))),
                ),
              ),
            ),
            Expanded(
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      _importNotes,
                      style: const TextStyle(color: Colors.brown),
                    ))),
          ],
        ),
      ),
    );
  }
}

class _SubtitleWidget extends StatelessWidget {
  const _SubtitleWidget({
    super.key,
    this.textAlign = TextAlign.center,
    required this.description,
  }); // if the client dont give us a textAlign then this method will be center
  final TextAlign textAlign;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Colors.brown.shade600,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.brown.shade500,
            fontWeight: FontWeight.w900,
            fontSize: 30,
          ),
    );
  }
}

class PaddingItems {
  final EdgeInsets horizontalPadding =
      const EdgeInsets.symmetric(horizontal: 40);
  final EdgeInsets verticalPadding = const EdgeInsets.symmetric(vertical: 10);
}
