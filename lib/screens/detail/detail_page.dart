import 'package:flutter/material.dart';
import 'package:marvel_app/models/results.dart';
import 'package:marvel_app/widgets/character_items_list.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  Results character;
  DetailPage(this.character);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text(
                  widget.character.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                background: Image.network(
                  '${widget.character.thumbnail.path}/landscape_large.${widget.character.thumbnail.extension}',
                  fit: BoxFit.cover,
                ),
              ),
            )
          ];
        },
        body: CharacterItemsList(widget.character),
        );
  }

}
