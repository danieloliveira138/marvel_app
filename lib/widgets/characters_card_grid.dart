import 'package:flutter/material.dart';
import 'package:marvel_app/widgets/image_placeholder.dart';
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
          ImageMarvel.landscapeLarge(
            _character.thumbnail,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
