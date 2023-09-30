import 'package:dio/dio.dart';

mixin class ProjectDioMixin { // for not rewriting in all project that Dio url process
  final service = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));
}