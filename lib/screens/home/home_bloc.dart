import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:marvel_app/data/repository.dart';
import 'package:marvel_app/models/api_response.dart';
import 'package:marvel_app/models/results.dart';
import 'package:marvel_app/modules/app_module.dart';

class HomeBloc extends BlocBase {

  bool _isFetchingData = false;
  List<Results> _list = List<Results>();
  List<Results> get list => _list;

  int _gridCount = 1;
  int get gridCount => _gridCount;
  int get listLength => _list.length;

  StreamController<List<Results>> _characters$ = StreamController<List<Results>>();
  Stream<List<Results>> get characters => _characters$.stream;

  StreamController<bool> _loading$ = StreamController<bool>();
  Stream<bool> get loading => _loading$.stream;

  get showLoading => _characters$.sink.add(null);

  addToList(List<Results> results) => _list.addAll(results);

  singleCount() {
    if (_gridCount == 1) {
      return;
    }
    _gridCount = 1;
    _characters$.add(_list);
  }

  doubleCount() {
    if (_gridCount == 2) {
      return;
    }
    _gridCount = 2;
    _characters$.add(_list);
  }

  getCharacters(int offset) {
    if(_isFetchingData) {
      return;
    }
    _fetchData(offset);
  }

    _fetchData(int offset) async {
      _isFetchingData = true;
      _loading$.add(true);
      ServerResponse response = await AppModule.to.getDependency<Repository>().requestCharacters(offset);

      if(response.status) {

        _list.addAll(response.result.data.results);
        _characters$.add(_list);
        _isFetchingData = false;
        _loading$.add(false);

      } else {

        _characters$.addError(response.result);
        _isFetchingData = false;
        _loading$.add(false);

      }
    }

    @override
    void dispose() {
      _characters$.close();
      _loading$.close();
      super.dispose();
    }
  }
