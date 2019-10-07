import 'package:flutter/material.dart';
import 'package:marvel_app/models/thumbnail.dart';
import 'package:transparent_image/transparent_image.dart';

// ignore: must_be_immutable
class ImageMarvel extends StatelessWidget {
  BoxFit fit;
  Thumbnail thumbnail;
  double width;

  ImageMarvel(this.thumbnail, {this.fit, this.width});

  @override
  Widget build(BuildContext context) {
    return FadeInImage.memoryNetwork(
            width: width,
            placeholder: kTransparentImage,
            image: '${thumbnail.path}/landscape_large.${thumbnail.extension}',
            fit: fit ?? BoxFit.none,
          );
  }
}