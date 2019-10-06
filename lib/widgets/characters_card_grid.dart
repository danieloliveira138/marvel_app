import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:marvel_app/models/results.dart';

// ignore: must_be_immutable
class CharactersCardGrid extends StatelessWidget {
  Results _character;

  CharactersCardGrid(this._character);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: '${_character.thumbnail.path}/landscape_large.${_character.thumbnail.extension}',
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
