import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marvel_app/models/results.dart';
import 'package:marvel_app/screens/detail/detail_bloc.dart';
import 'package:marvel_app/screens/detail/detail_page.dart';

import '../main_bloc.dart';

// ignore: must_be_immutable
class DetailModule extends ModuleWidget {
  Results character;
  DetailModule(this.character);

  @override
  List<Bloc<BlocBase>> get blocs => [
    Bloc((_) => MainBloc()),
    Bloc((_) => DetailBloc()),
  ];

  @override
  List<Dependency> get dependencies => null;

  @override
  Widget get view => DetailPage(character);

  static Inject get to => Inject<DetailModule>.of();
}