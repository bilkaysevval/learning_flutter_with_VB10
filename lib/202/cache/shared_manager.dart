import 'package:learning/202/cache/shared_not_initalize.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { counter, users } // for not giving permission any other keys
// from now on; keys must be type of this enum

class SharedManager {
  SharedPreferences? preferences; // can be null

  SharedManager();

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkPrefences() { // exception handling for if it is null
    if (preferences == null) throw SharedNotInitializeException();
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkPrefences();
    await preferences?.setString(key.name, value);
  }

  // for getting List
  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    _checkPrefences();
    await preferences?.setStringList(key.name, value);
  }

  List<String>? getStrings(SharedKeys key) { // it is not Future because we can get data from key
    _checkPrefences();
    return preferences?.getStringList(key.name);
  }

  String? getString(SharedKeys key) {
    _checkPrefences();
    return preferences?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    _checkPrefences();
    return (await preferences?.remove(key.name)) ?? false;
  }
}