import 'package:flutter/material.dart';
import 'package:marvel_app/modules/app_module.dart';
import 'package:marvel_app/widgets/characters_card.dart';
import 'package:marvel_app/widgets/characters_card_grid.dart';
import 'package:marvel_app/models/results.dart';
import 'package:marvel_app/widgets/progress_view.dart';
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
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.crop_square),
          color: Colors.white,
          onPressed: () => AppModule.to.bloc<HomeBloc>().singleCount(),
        ),
        IconButton(
          icon: Icon(Icons.grid_on),
          color: Colors.white,
          onPressed: () => AppModule.to.bloc<HomeBloc>().doubleCount(),
        )
      ],
    );
  }

  _body() {
    return Stack(
      children: <Widget>[
        _listCharacters(),
        _progressIndicator(),
      ],
    );
  }

  _progressIndicator() {
    return StreamBuilder(
      stream: AppModule.to.bloc<HomeBloc>().loading,
      initialData: true,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data) {
            return ProgressView();
          }
        }
        return Container();
      },
    );
  }

  _listCharacters() {
    return StreamBuilder<List<Results>>(
        stream: AppModule.to.bloc<HomeBloc>().characters,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error to load data'),
            );
          }

          if (!snapshot.hasData) {
            return Container();
          }

          if (snapshot.hasData) {
            return GridView.builder(
                itemCount: snapshot.data.length,
                controller: _scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: AppModule.to.bloc<HomeBloc>().gridCount),
                itemBuilder: (context, index) {
                  switch (AppModule.to.bloc<HomeBloc>().gridCount) {
                    case 1:
                      return CharactersCard(
                        snapshot.data[index],
                      );
                    case 2:
                      return CharactersCard(
                        snapshot.data[index],
                        fontSize: 16,
                      );
                  }
                });
          }
        });
  }

  void _scrollEvent() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      AppModule.to
          .bloc<HomeBloc>()
          .getCharacters(AppModule.to.bloc<HomeBloc>().listLength);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollEvent);
    super.dispose();
  }
}
