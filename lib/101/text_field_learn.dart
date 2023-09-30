import 'package:flutter/material.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({Key? key}) : super(key: key);

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TextField(
        maxLength: 25,
        buildCounter: (BuildContext context, {int? currentLength, bool? isFocused, int? maxLength}){
          return AnimatedContainer(
            key: key,
            duration: const Duration(seconds: 1),
            height: 10,
            width: 10.0 * (currentLength ?? 0),
            color: Colors.green.shade800,
          );
        },
        keyboardType: TextInputType.emailAddress,  // klavye acildiginda mail icin gerekli elemanlari icerir
        autofillHints: const [AutofillHints.email],  // otomatik olarak geri kalani mail oalcak sekilde tamamlar
        textInputAction: TextInputAction.next,  // textinputaction sayesinde textfieldlarla klavye uzerinden islemler gerceklestirebiliriz klavyede nexte basinca bir sonraki textfielda gecer
//      InputFormatters ile eski ve yeni girilen degerleri karsilastirip onlarla ilgili islemler yapabiliriz.
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.mail),
            border: OutlineInputBorder(),
            hintText: "mail",
            labelText: "mail"),
      ),
    );
  }
}
