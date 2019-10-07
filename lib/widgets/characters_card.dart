import 'package:flutter/material.dart';
import 'package:marvel_app/models/results.dart';
import 'package:marvel_app/modules/detail_module.dart';
import 'package:marvel_app/widgets/image_placeholder.dart';
import 'package:marvel_app/utils/nav.dart';

// ignore: must_be_immutable
class CharactersCard extends StatelessWidget {
  Results _character;
  double fontSize;
  CharactersCard(this._character, {this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        nav(context, DetailModule(_character));
      },
      child: Card(
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
                child: ImageMarvel(
                  _character.thumbnail,
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
      ),
    );
  }
}
