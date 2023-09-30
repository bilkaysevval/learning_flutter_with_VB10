class User {
  String? name;
  String? description;
  String? url;

  User(this.name, this.description, this.url);

//  we got json to dart code for using in encoding (user_cache_manager)
  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['url'] = url;
    return data;
  }
}