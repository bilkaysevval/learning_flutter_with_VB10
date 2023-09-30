import 'dart:io';

import 'package:dio/dio.dart';

import '../model/resource_model.dart';

abstract class IReqresService {
  IReqresService(this.dio);
  final Dio dio;

  Future<ResourceModel?> fetchResourceItem();
}

enum _ReqResPath { resource }

class ReqresService extends IReqresService {
  ReqresService(Dio dio) : super(dio); // dio comes from

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    final response = await dio.get('/${_ReqResPath.resource.name}');

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) { // made Map because we want to get single elements not List
        return ResourceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}