import 'package:flutter/material.dart';
import 'package:marvel_app/models/results.dart';

// ignore: must_be_immutable
class CharactersCard extends StatelessWidget {
  Results _character;

  CharactersCard(this._character);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        margin: EdgeInsets.all(16),
        elevation: 4,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Image.network(
                  '${_character.thumbnail.path}/landscape_large.${_character.thumbnail.extension}',
                  fit: BoxFit.fitWidth,
                )
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Text(
                _character.name,
                style: TextStyle(
                    fontSize: 32,

                  )
                ),
            )
          ],
        ),
      ),
    );
  }
}
