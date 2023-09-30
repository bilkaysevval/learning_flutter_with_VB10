import 'package:flutter/material.dart';

class LifeCycleLearn extends StatefulWidget {
  const LifeCycleLearn({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  State<LifeCycleLearn> createState() => _LifeCycleLearnState();
}

class _LifeCycleLearnState extends State<LifeCycleLearn> {
  String _message = '';
  late final bool _isOdd;  // late yapmamizin nedeni constructor aninda buna deger atayabilmek ve classin icinde kullanabilmek

  @override
  void initState() {      // initState, constructor gibi dusunulebilir. build methodu initstate bittikten sonra calismaya baslar.
// initstate fonksiyonlari bir kere yazilir eger hata aliyorsak bastan baslatmaliyiz
    super.initState();
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;
    _computeName();
  }

  // @override
  // void didChangeDependencies() {  // initstate'ten once cagrilir. sayfa komple olusturuldugunda cagrilir. tekrar tekrar cagirilma ihtimali var.
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  // }

  // @override
  // void didUpdateWidget(covariant LifeCycleLearn oldWidget) { // projede bi degisiklik oldugu zaman cagrilir.
  //   // TODO: implement didUpdateWidget
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  void dispose() {  // bazi componentlerin olmesi icin kullanilir.
    // TODO: implement dispose
    super.dispose();
  }

  void _computeName() {
    if(_isOdd){_message += " odd";}
    else { _message += " even";}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_message),
      ),
      body: ElevatedButton(onPressed: () {}, child: Text(_message)),
    );
  }
}
