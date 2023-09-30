class PostModel1 {   // values can be null and there is no constructor in here
  int? userId;
  int? id;
  String? title;
  String? body;
}
// final user1 = PostModel1()
// ..userId = 1
// ..body = 'vb';
// user1.body = 'hello';


class PostModel2 {  // values must be given in constructor but then they CAN be updated because we didnt give them 'final'
  int userId;
  int id;
  String title;
  String body;

  PostModel2(this.userId, this.id, this.title, this.body);
}
// final user2 = PostModel2(1, 2, 'b', 'a');
// user2.body = 'a';


class PostModel3 { // values must be given in constructor but then they CANNOT be updated because we gave them 'final'
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel3(this.userId, this.id, this.title, this.body);
}
// final user3 = PostModel3(1, 2, 'a', 'b');


class PostModel4 {  // this structure works like above but it's constructor has named parameters.
  // because we put it in curly brackets
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel4({required this.userId, required this.id, required this.title, required this.body});
}
// final user4 = PostModel4(userId: 1, id: 2, title: 'a', body: 'b');


class PostModel5 {  // we CANNOT access the variables because we make them private
  // if we want to access then we must create getter functions like at line 55 and then we can access like at line 67
  final int _userId;
  final int _id;
  final String _title;
  final String _body;

  int get userId => _userId;  // getter function
  PostModel5({
    required int userId,
    required int id,
    required String title,
    required String body,
  })  : _userId = userId,
        _id = id,
        _title = title,
        _body = body;
}
// final user5 = PostModel5(userId: 1, id: 2, title: 'title', body: 'body');
// user5.userId;


class PostModel6 {  // works like above
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel6({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}
// final user6 = PostModel6(userId: 1, id: 2, title: 'a', body: 'b');


class PostModel7 {  // works like above but we if we dont give it parameters then it is okay because we did not make them required
  // we defined them at the beginning
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel7({
    int userId = 0,
    int id = 0,
    String title = '',
    String body = '',
  }) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}
// final user7 = PostModel7();


class PostModel8 {  // for getting data from service
  final int? userId;
  final int? id;
  String? title;
  String? body;

  PostModel8({this.userId, this.id, this.title, this.body});

  void updateTitle(String? data) {
    if (data != null && data.isNotEmpty) {
      title = data;
    }
  }

  PostModel8 copyWith({  // it prevents to getting lost the variables. works with copies
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel8(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}