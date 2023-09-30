
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning/202/service/post_model.dart';

class ServicePostLearnView extends StatefulWidget {
  const ServicePostLearnView({Key? key}) : super(key: key);

  @override
  State<ServicePostLearnView> createState() => _ServicePostLearnViewState();
}

class _ServicePostLearnViewState extends State<ServicePostLearnView> {
  bool _isLoading = false;
  late final Dio _networkManager;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';
  String? name;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void _changeLoading(){
    setState(() {
      _isLoading = !_isLoading;
    });
  }


  Future<void> _addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await _networkManager.post('posts', data: postModel);
    if (response.statusCode == HttpStatus.created) {
      name = 'successed';
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [_isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(controller: _titleController, decoration: const InputDecoration(labelText: 'title: '), keyboardType: TextInputType.text, textInputAction: TextInputAction.next,),
            TextField(controller: _bodyController, decoration: const InputDecoration(labelText: 'body: '), keyboardType: TextInputType.text, textInputAction: TextInputAction.next),
            TextField(controller: _userIdController, decoration: const InputDecoration(labelText: 'id: '), keyboardType: TextInputType.number, autofillHints: const [AutofillHints.telephoneNumber],),
            TextButton(
                onPressed: _isLoading ? null : () {
                  if (_titleController.text.isNotEmpty &&
                      _bodyController.text.isNotEmpty &&
                      _userIdController.text.isNotEmpty) {
                    final model = PostModel(
                        body: _bodyController.text,
                        title: _titleController.text,
                        userId: int.tryParse(_userIdController.text));

                    _addItemToService(model);
                  }
                },
                child: const Text('Send'))
          ],
        ),
      ),
    );
  }
}



//   Future fetchPostItems() async {
//     _changeLoading();  // for loading button
//     final response = await Dio().get('https://jsonplaceholder.typicode.com/posts');  // Dio().get() returns a Future which means async response so we must use async and await
//// getting the data from service each time is not true so we should use fetchPostItemsAdvanced()
//     if(response.statusCode == HttpStatus.ok){
//       final _datas = response.data;
//
//       if(_datas is List){
//         setState((){
//           _items = _datas.map((e) => PostModel.fromJson(e)).toList();
//         });
//       }
//     }
//     _changeLoading();   // for loading button
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [_isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()],
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         itemCount: _items?.length ?? 1,
//           itemBuilder: (context, index) {
//             return _PostCard(model: _items?[index],);
//           },),
//     );
//   }
// }

class _PostCard extends StatelessWidget {
  const _PostCard({
    super.key,
    required PostModel? model,
  }) : _model = model;

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(_model?.title ?? '',),
        subtitle: Text(_model?.body ?? '',),
      ),
    );
  }
}
