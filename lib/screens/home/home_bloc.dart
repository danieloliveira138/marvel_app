import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:marvel_app/data/repository.dart';
import 'package:marvel_app/models/api_response.dart';
import 'package:marvel_app/models/results.dart';
import 'package:marvel_app/modules/app_module.dart';

class HomeBloc extends BlocBase {

  bool _isFetchingData = false;
  StreamController<List<Results>> _characters$ = StreamController<List<Results>>();
  Stream<List<Results>> get characters => _characters$.stream;
  get showLoading => _characters$.sink.add(null);
  List<Results> _characters = List<Results>();
  int get charactersLenght => _characters.length;

  getCharacters(int offset) {
    if(_isFetchingData) {
      return;
    }
    _fetchData(offset);
  }

  _fetchData(int offset) async {
    _isFetchingData = true;
    ServerResponse response = await AppModule.to.getDependency<Repository>().requestCharacters(offset);

    if(response.status) {
      _characters.addAll(response.result.data.results);
      _characters$.add(_characters);
      _isFetchingData = false;
    } else {
      _characters$.addError(response.result);
      _isFetchingData = false;
    }
  }

  @override
  void dispose() {
    _characters$.close();
    super.dispose();
  }

}