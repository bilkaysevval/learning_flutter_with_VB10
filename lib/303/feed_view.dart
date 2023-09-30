import 'package:flutter/material.dart';

import '../202/service/post_model.dart';
import '../202/service/post_service.dart';

// we want that when this page is opened then request to service
//FutureBuilder can be used for widgets that will change according to your data
// and the status of your data are specified in the 'builder'
// and network or service works are done in the 'future'
// You can create a switch-case according to ConnectionState
// or create an if-else structure with snapshot.HasData
// and create a structure according to the null return of your data

class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> with AutomaticKeepAliveClientMixin {
  // AutomaticKeepAliveClientMixin prevents requesting each time the page is opened
  final IPostService _postService = PostService(); // our PostService class
  late final Future<List<PostModel>?> _itemsFuture;
  // we made this late final because we want that when we press the FloatingActionButton not leap
  // which means data went and come again in a second
  // in this way; we gave its value in initState and it has its data final. it cannot be changed
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _itemsFuture = _postService.fetchPostItemsAdvance();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // for AutomaticKeepAliveClientMixin
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
      ),
      appBar: AppBar(
        actions: [ElevatedButton(onPressed: () {}, child: const Icon(Icons.ac_unit))],
      ),
      body: _FeedFutureBuilder(itemsFuture: _itemsFuture),
    );
  }

  @override // for AutomaticKeepAliveClientMixin
  bool get wantKeepAlive => true; // it means we want to keep data which is came from service which is called at the beginning for not re-requesting to the service
}

class _FeedFutureBuilder extends StatelessWidget {
  const _FeedFutureBuilder({
    Key? key,
    required Future<List<PostModel>?> itemsFuture,
  })  : _itemsFuture = itemsFuture,
        super(key: key);

  final Future<List<PostModel>?> _itemsFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostModel>?>(
      future: _itemsFuture,
      builder: (BuildContext context, AsyncSnapshot<List<PostModel>?> snapshot) {
        // AsyncSnapshot keeps the data which returns from Future
        switch (snapshot.connectionState) {
          case ConnectionState.none: // when service connection broken
            return const Placeholder();
          case ConnectionState.waiting:
          case ConnectionState.active:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasData) { // if it is true then it means that a data has came
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data?[index].body ?? ''),
                    ),
                  );
                },
              );
            } else {
              return const Placeholder();
            }
        }
      },
    );
  }
}

