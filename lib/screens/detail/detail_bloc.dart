import 'dart:async';
import 'package:marvel_app/models/results.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:marvel_app/data/repository.dart';
import 'package:marvel_app/models/api_response.dart';
import 'package:marvel_app/modules/detail_module.dart';

class DetailBloc extends BlocBase {

  StreamController<bool> _progress$ = StreamController<bool>();
  Stream<bool> get progress => _progress$.stream;

  StreamController<Results> _contentPage$ = StreamController<Results>();
  Stream<Results> get content => _contentPage$.stream;

  toNextPage(String url) async {
    _progress$.add(true);
    print('progress true');
    ServerResponse response = await DetailModule.to.getDependency<Repository>().singleRequest(url);

    if(response.status) {
      print('progress true : ${response.result.toString()}');

      _contentPage$.add(response.result.data.results[0]);
      _progress$.add(false);
    } else {
      print('progress false');
      _progress$.add(false);
    }

  }

  @override
  void dispose() {
    _progress$.close();
    _contentPage$.close();
    super.dispose();
  }
}