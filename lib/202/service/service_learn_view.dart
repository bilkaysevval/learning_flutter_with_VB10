import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning/202/service/comments_learn_view.dart';
import 'package:learning/202/service/post_model.dart';
import 'package:learning/202/service/post_service.dart';

class ServiceLearnView extends StatefulWidget {
  const ServiceLearnView({Key? key}) : super(key: key);

  @override
  State<ServiceLearnView> createState() => _ServiceLearnViewState();
}

class _ServiceLearnViewState extends State<ServiceLearnView> {
  List<PostModel>? _items;
  bool _isLoading = false;
  late final Dio _networkManager; // for not rewriting Dio requests
  final _baseUrl =
      'https://jsonplaceholder.typicode.com/'; // for not rewriting Dio requests
  late final IPostService
      _postService; // we give this PostService class in here because we shouldnt see this url codes in view class

  @override
  void initState() {
    // 'await' cannot be in here because initstate starts and ends. it doesnt wait anything
    super.initState();
    _networkManager =
        Dio(BaseOptions(baseUrl: _baseUrl)); // for not rewriting Dio requests
    _postService = PostService();
    fetchPostItemsAdvanced();
  }

  void _changeLoading() {
    setState(() {
      _isLoading =
          !_isLoading; // set its opposite. if it's true then it will be false
    });
  }

  Future fetchPostItemsAdvanced() async {
    // third process (with PostService())
    _changeLoading(); // for loading button
    _items = await _postService.fetchPostItemsAdvance();
    _changeLoading(); // for loading button
  }

  // Future fetchPostItemsAdvanced() async {  // second process
  //   _changeLoading();  // for loading button
  //   final response = await _networkManager.get('posts');  // Dio().get() returns a Future which means async response so we must use async and await
  //
  //   if(response.statusCode == HttpStatus.ok){
  //     final _datas = response.data;
  //
  //     if(_datas is List){
  //       setState((){
  //         _items = _datas.map((e) => PostModel.fromJson(e)).toList();
  //       });
  //     }
  //   }
  //   _changeLoading();   // for loading button
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _isLoading
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink()
        ],
      ),
      body: _items == null
          ? const Placeholder()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount:
                  _items?.length ?? 1, // if length = 0 then let length be 1
              itemBuilder: (context, index) {
                return _PostCard(
                  model: _items?[index],
                );
              },
            ),
    );
  }
}

//   Future fetchPostItems() async {  // first process
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
//         itemCount: _items?.length ?? 1, // if length = 0 then let length be 1
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
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CommentsLearnView(
              postId: _model?.id,
            ),
          ));
        },
        title: Text(
          _model?.title ?? '',
        ),
        subtitle: Text(
          _model?.body ?? '',
        ),
      ),
    );
  }
}
