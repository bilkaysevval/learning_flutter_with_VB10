import 'package:dio/src/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../101/image_learn.dart';
import '../../../product/global/resource_context.dart';
import '../../../product/global/theme_notifier.dart';
import '../../../product/service/project_dio.dart';
import '../model/resource_model.dart';
import '../service/reqres_service.dart';
import '../view_model/reqres_provider.dart';
import '../view_model/reqres_view_model.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({Key? key}) : super(key: key);

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

// class _ReqResViewState extends ReqresViewModel {
class _ReqResViewState extends State<ReqResView> with ProjectDioMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqResProvider>(
      create: (context) => ReqResProvider(ReqresService(service)),
      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ThemeNotifier>().changeTheme(); // when we press the button the theme will be changed
              // we can 'read' the change just once or we can 'watch' always the each change
            },
          ),
          appBar: AppBar(
              actions: const [_SaveAndNavigate()],
              title: context.watch<ReqResProvider>().isLoading
                  ? const CircularProgressIndicator(color: Colors.white) : null),
          body: Column(
            children: [
              const _TempPlaceHolder(),
              Expanded(child: _resourceListview(context, context.watch<ReqResProvider>().resources)),
            ],
          ),
        );
      },
    );
  }

  ListView _resourceListview(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(child: Text(items[index].name ?? ''));
      },
    );
  }
}

class _SaveAndNavigate extends StatelessWidget {
  const _SaveAndNavigate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context
              .read<ReqResProvider>()
              .saveToLocale(context.read<ResourceContext>(), context.read<ReqResProvider>().resources);
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return const ImageLearn();
          }));
        },
        child: const Icon(Icons.ac_unit));
  }
}

class _TempPlaceHolder extends StatelessWidget {
  const _TempPlaceHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Selector and Consume allows us to watch just specific changes that we want
    // in this examplw we will only listen bool changes
    return Selector<ReqResProvider, bool>(builder: (context, value, child) {
      return value ? const Placeholder() : const Text('data');
    }, selector: (context, provider) {
      return provider.isLoading;
    });
  }
}