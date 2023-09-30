import 'package:flutter/material.dart';
import 'package:learning/product/custom_widgets/buttons/answer_button.dart';
import 'package:learning/product/custom_widgets/buttons/loading_button.dart';
import 'package:learning/product/custom_widgets/call_back_dropdown.dart';

// for reporting back if any change happens

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallBackDropDown(onUserSelected: (CallbackUser user) {
            print(user);
          },),
          AnswerButton(
            onNumber: (number) {
              return number % 3 == 1;
              // it returns true or false by random number
            },
          ),
          LoadingButton(
            title: 'save',
            callback: () async {
              await Future.delayed(const Duration(seconds: 2));
            },
          ),
        ],
      ),
    );
  }
}

class CallbackUser {
  final String name;
  final int id;

  // we got this error: there should be exactly one item but we already have two item
  // but in Lists; all items seems just one item because their references is same
  // so we have to override this function for checking that if their names and ids are same even though their references are same
  @override // generate equality
  bool operator ==(Object other) {
    if(identical(this, other)) return true;
    return other is CallbackUser && other.name == name && other.id == id;
  }

  CallbackUser(this.name, this.id);

  // TODO Dummy Remove it
  static List<CallbackUser> dummyUsers() {
    return [
      CallbackUser('vb1', 123),
      CallbackUser('vb2', 124),
    ];
  }
}