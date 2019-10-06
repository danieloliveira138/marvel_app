import 'package:flutter/material.dart';
import 'package:marvel_app/models/thumbnail.dart';

// ignore: must_be_immutable
class CharactersCard extends StatelessWidget {
  Thumbnail thumbnail;

  CharactersCard(this.thumbnail);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(16),
        elevation: 4,
        child: Image.network(
          '${thumbnail.path}/landscape_large.${thumbnail.extension}',
          fit: BoxFit.fitWidth,
        )
      ),
    );
  }
}
