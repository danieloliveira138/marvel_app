import 'package:flutter/material.dart';
import 'package:marvel_app/models/results.dart';
import 'package:transparent_image/transparent_image.dart';

// ignore: must_be_immutable
class CharactersCard extends StatelessWidget {
  Results _character;
  double fontSize;
  CharactersCard(this._character, {this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.loose,
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: '${_character.thumbnail.path}/landscape_large.${_character.thumbnail.extension}',
                fit: BoxFit.fill,
                ),
            ),
            Container(
                width: double.infinity,
                color: Colors.black45,
                padding: EdgeInsets.all(8),
                child: Text(
                  _character.name,
                  style: TextStyle(
                    fontSize: fontSize ?? 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
