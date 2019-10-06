import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';

class MainBloc extends BlocBase{
  bool _isDark = false;

  final StreamController<bool> _theme$ = StreamController<bool>();
  Stream<bool> get theme => _theme$.stream;

  changeTheme() {
    _isDark = !_isDark;
    _theme$.add(_isDark);
  }

  dispose() {
    _theme$.close();
    super.dispose();
  }

}