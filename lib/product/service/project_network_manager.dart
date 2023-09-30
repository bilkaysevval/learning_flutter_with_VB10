import 'package:dio/dio.dart';

// we made this class singleton
class ProjectNetworkManager {
  ProjectNetworkManager._() { // making it private
    _dio = Dio(BaseOptions(baseUrl: 'pub.dev'));

    _dio.options = BaseOptions();
  }
  late final Dio _dio;

  static ProjectNetworkManager instance = ProjectNetworkManager._();

  Dio get service => _dio;

  void addBaseHeaderToToken(String token) { // token is the users data which is come from after login
    _dio.options = _dio.options.copyWith(
        headers: {"Authorization": token});
  }
}


class DurationManager {
  DurationManager._();
  static DurationManager? _manager; // can be null
  static DurationManager get manager {
    if(_manager != null) return _manager!; // (forced)
    _manager = DurationManager._();
    return _manager!;
  }
}