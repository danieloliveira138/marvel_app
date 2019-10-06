import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marvel_app/data/repository.dart';
import 'package:marvel_app/screens/home/home_bloc.dart';
import '../main_bloc.dart';
import '../my_app.dart';
import 'package:http/http.dart' as http;

class AppModule extends ModuleWidget {

  @override
  List<Bloc<BlocBase>> get blocs => [
    Bloc((_) => MainBloc()),
    Bloc((_) => HomeBloc()),
  ];

  @override
  List<Dependency> get dependencies => [
    Dependency((_) => Repository(http.Client())),
  ];

  @override
  Widget get view => MyApp();

  static Inject get to => Inject<AppModule>.of();

}