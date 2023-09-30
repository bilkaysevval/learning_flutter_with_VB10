import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({Key? key}) : super(key: key);
  final String _imagePath = 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fphotos%2Fbooks-shelves-library-bookshelf-3981515%2F&psig=AOvVaw1eq2QCUpW6Hf__sfoQgQrp&ust=1678361513542000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCIiqwoCezP0CFQAAAAAdAAAAABAE';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: SizedBox(
                height: 300,
                width: 300,
                child: PngImages(name: ImageItems().rainbow),
                //fit: BoxFit.fitHeight,
                //repeat: ImageRepeat.repeat,)
            ),
          ),
          Image.network(_imagePath,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.access_alarm_rounded),// if that image cannot be loaded then this error will be activated
          ),
        ],
      ),
    );
  }
}
// if we create a folder in assets folder and fill it with images then we can write just assets/folder's_name in pupspec.yaml
// we dint have to write all of these images path in pupspec.yaml
class ImageItems {
  final String books = "Book-Stack-PNG-Background-Image";
  final String rainbow = "Rainbow-cartoon-on-transparent-background-PNG-1";
  final String blueAestethicBooks = "png-transparent-book-of-revelation-book-photography-wood-used-book";
  final String pinkAestethicBooks = "426-4260745_png-pngs-transparent-transparents-sticker-stickers-aesthetic-books";
  final String brownStickyNote = "output-onlinepngtools";
}

// if we want to create a class for images;
class PngImages extends StatelessWidget {
  const PngImages({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/pngs/$name.png", fit: BoxFit.fill,);
  }
}

