import 'package:flutter/material.dart';
import 'shared_manager.dart';
import 'user_model.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

// we extended LoadingStateful class in this class because we will use ChangeLoading function
// normally -->  extends State<SharedLearn>
class _SharedLearnState extends LoadingStateful<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _manager;

  late final List<User> userItems;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    userItems = UserItems().users;  // dummy code
    _initialize();
  }

  Future<void> _initialize() async {
    changeLoading();
    await _manager.init();
    changeLoading();
    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    // we defined this process in a different function from the initState
    // because initState runs just one time at the beginning of the project. it cant have await async
    // final prefs = await SharedPreferences.getInstance();
    // final int? counter = prefs.getInt('value');

    // we are using as follows now because we created SharedManager class
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  void _onChangeValue(String value) {
    // on changed value of text field
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_currentValue.toString()), actions: [
        _loading(context)
      ]),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          _removeValueButton(),
        ],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangeValue(value);
            },
          ),
        ],
      ),
    );
  }

  Widget _loading(BuildContext context) {
    return isLoading
          ? CircularProgressIndicator(
              color: Theme.of(context).scaffoldBackgroundColor,
            )
          : const SizedBox.shrink();
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      onPressed: (() async {
        // we want to save previous value when pressing the button
        changeLoading(); // we created this function
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        changeLoading();
      }),
      child: const Icon(Icons.save),
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      onPressed: (() async {
        // we want to save previous value when pressing the button
        changeLoading(); // we created this function
        await _manager.removeItem(SharedKeys.counter);
        changeLoading();
      }),
      child: const Icon(Icons.delete_outline),
    );
  }
}


// commanded this because we created an User class in user_model.dart
// class User {  // we want to show this information in a card
//   // getting data from user
//   final String name;
//   final String description;
//   final String url;
//
//   User(this.name, this.description, this.url);
// }

class UserItems { // equalizing incoming data with this variables and put in list
  late final List<User> users;
  UserItems(){
    users = [
      User('vb1', '101', 'vb10.dev'),
      User('vb2', '102', 'vb10.dev'),
      User('vb3', '103', 'vb10.dev'),
      User('vb4', '104', 'vb10.dev'),
    ];
  }
}

// we extended this class  by StatefulWidget
// because we will use setState
// we can use this class anywhere in our project
abstract class LoadingStateful<T extends StatefulWidget> extends State<T> {
  // for not changeLoading function
  // extend this class in _SharedLearnState

  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
