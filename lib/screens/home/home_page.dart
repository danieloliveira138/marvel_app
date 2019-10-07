import 'package:flutter/material.dart';
import 'package:marvel_app/modules/app_module.dart';
import 'package:marvel_app/widgets/characters_card.dart';
import 'package:marvel_app/models/results.dart';
import 'package:marvel_app/widgets/progress_view.dart';
import '../../main_bloc.dart';
import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  AnimationController _iconAnimation;
  bool animationFlag = false;

  @override
  void initState() {
    _iconAnimation =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
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
          icon: AnimatedIcon(
            icon: AnimatedIcons.view_list,
            progress: _iconAnimation,
          ),
          onPressed: _handleAnimatedIconPressed,
        ),
        IconButton(
          icon: Icon(
            Icons.brightness_high,
          ),
          onPressed: () => AppModule.to.bloc<MainBloc>().changeTheme(),
        ),
      ],
    );
  }

  _body() {
    return Stack(
      children: <Widget>[
        _listCharacters(),
        ProgressStreamBuilder(
          AppModule.to.bloc<HomeBloc>().loading,
        ),
      ],
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
                  double fontSize = AppModule.to.bloc<HomeBloc>().gridCount == 1
                      ? 24.0
                      : 16.0;

                  return CharactersCard(
                    snapshot.data[index],
                    fontSize: fontSize,
                  );
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

  void _handleAnimatedIconPressed() {
    animationFlag = !animationFlag;
    if (animationFlag) {
      _iconAnimation.forward();
      AppModule.to.bloc<HomeBloc>().doubleCount();
    } else {
      _iconAnimation.reverse();
      AppModule.to.bloc<HomeBloc>().singleCount();
    }
  }
}
