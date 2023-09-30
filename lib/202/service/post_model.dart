// this file only must be used for getting data from service and sending data to service
class PostModel {
  // we can create this class by using json to dart converter
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModel({this.userId, this.id, this.title, this.body});
// code cannot be written here

  PostModel.fromJson(Map<String, dynamic> json) {
    // changing the type of data from json to string
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
// code cannot be written here

  Map<String, dynamic> toJson() {
    // getting data from json
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
