import 'dart:convert';
import '../shared_manager.dart';
import '../user_model.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  Future<void> saveItems(List<User> items) async {
     //Compute
     final _items = items.map((e) => jsonEncode(e.toJson())).toList(); // encoding Users into map
     await sharedManager.saveStringItems(SharedKeys.users, _items);
   }

  List<User>? getItems(){
    //Compute
    final itemsString = sharedManager.getStrings(SharedKeys.users);
    if(itemsString?.isNotEmpty ?? false){
      return itemsString!.map((e) {
        final jsonObject = jsonDecode(e);
        if (jsonObject is Map<String, dynamic>) {
          return User.fromJson(jsonObject);
        }
        return User('name', 'description', 'url');
      }).toList();
    }
    return null;
  }
}