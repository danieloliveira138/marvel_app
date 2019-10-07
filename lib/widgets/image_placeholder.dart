import 'package:flutter/material.dart';
import 'package:marvel_app/models/thumbnail.dart';
import 'package:transparent_image/transparent_image.dart';
// ignore: must_be_immutable
class ImageMarvel extends StatelessWidget {

  BoxFit fit;
  Thumbnail thumbnail;
  double width;
  String format;

  @override
  Widget build(BuildContext context) {
    return FadeInImage.memoryNetwork(
            width: width,
            placeholder: kTransparentImage,
            image: '${thumbnail.path}$format${thumbnail.extension}',
            fit: fit ?? BoxFit.none,
          );
  }

  ImageMarvel.landscapeLarge(this.thumbnail, {this.fit, this.width}) {
    this.format = '/landscape_large.';
  }

  ImageMarvel.portraitLarge(this.thumbnail, {this.fit, this.width}) {
    this.format = '/portrait_large.';
  }

  ImageMarvel.portraitIncredible(this.thumbnail, {this.fit, this.width}) {
    this.format = '/portrait_incredible.';
  }
  
}