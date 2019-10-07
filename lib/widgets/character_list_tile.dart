import 'package:flutter/material.dart';
import 'package:marvel_app/models/results.dart';
import 'package:marvel_app/widgets/image_placeholder.dart';
// ignore: must_be_immutable
class CharacterListTile extends StatelessWidget {
  Results _character;
  CharacterListTile(this._character,);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: ImageMarvel(
                  _character.thumbnail,
                  width: 100,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${_character.name}'),
                    Text('${_character.description}'),
                  ],
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

}
