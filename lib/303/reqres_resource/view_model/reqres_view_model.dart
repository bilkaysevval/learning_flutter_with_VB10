import 'package:flutter/material.dart';
import 'package:learning/product/service/project_network_manager.dart';
import '../../../202/cache/shared_learn_cache.dart';
import '../../../product/service/project_dio.dart';
import '../model/resource_model.dart';
import '../service/reqres_service.dart';
import '../view/reqres_view.dart';

// extended by LoadingStateful because for using changeLoading function
abstract class ReqresViewModel extends LoadingStateful<ReqResView> with ProjectDioMixin {
  late final IReqresService reqresService;
  List<Data> resources = [];

  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(ProjectNetworkManager.instance.service);
    // in this way we made this service common. they can communicate
    ProjectNetworkManager.instance.addBaseHeaderToToken('veli');
    // if user will login then user's token is ready for all project we dont need rewrite it
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [] ;
    changeLoading();
  }
}