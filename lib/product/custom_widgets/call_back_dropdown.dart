import 'package:flutter/material.dart';

import '../../303/call_back_learn.dart';

class CallBackDropDown extends StatefulWidget {
  const CallBackDropDown({super.key, required this.onUserSelected});

  final void Function(CallbackUser user) onUserSelected; // we made a parameter for CallBackDropDown widget

  @override
  State<CallBackDropDown> createState() => _CallBackDropDownState();
}

class _CallBackDropDownState extends State<CallBackDropDown> {
  CallbackUser? _user;

  void _updateUser(CallbackUser? item) {
    setState(() {
      _user = item;
    });
    if(_user != null){
      widget.onUserSelected.call(_user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CallbackUser>(
      value: _user,
      style: Theme.of(context).textTheme.headlineLarge,
      items: CallbackUser.dummyUsers().map((e) {
        return DropdownMenuItem(value: e,child: Text(e.name, style: Theme.of(context).textTheme.headlineLarge),);
      }).toList(),
      onChanged: _updateUser);
  }
}
