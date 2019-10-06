import 'package:flutter/material.dart';
import 'package:marvel_app/modules/app_module.dart';
import 'package:marvel_app/widgets/characters_card.dart';
import 'package:marvel_app/widgets/progress_card.dart';
import 'package:marvel_app/models/results.dart';
import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_scrollEvent);
    AppModule.to.bloc<HomeBloc>().getCharacters(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _body(),
    );
  }

  _appbar() {
    return AppBar(
      title: Text('Marvel App'),
      elevation: 8,
    );
  }

  _body() {
    return StreamBuilder(
        stream: AppModule.to.bloc<HomeBloc>().characters,
        builder: (context, snapshot) {

          if (snapshot.hasError) {
            return Center(
              child: Text('Error to load data'),
            );
          }

          List<Results> list = List<Results>();

          if (snapshot.hasData) {
            list.addAll(snapshot.data);

            return ListView.builder(
              addAutomaticKeepAlives: true,
              itemCount: list.length + 1,
              controller: _scrollController,
              itemBuilder: (context, index) {
                if (index == list.length) {
                  return ProgressCard();
                } else {
                  return CharactersCard(snapshot.data[index].thumbnail);
                }
              }
            );
          }
        }
      );
  }

  void _scrollEvent() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      AppModule.to
          .bloc<HomeBloc>()
          .getCharacters(AppModule.to.bloc<HomeBloc>().charactersLenght);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollEvent);
    super.dispose();
  }
}
