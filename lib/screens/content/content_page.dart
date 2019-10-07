import 'package:flutter/material.dart';
import 'package:marvel_app/models/results.dart';
import 'package:marvel_app/models/thumbnail.dart';
import 'package:marvel_app/widgets/image_placeholder.dart';
// ignore: must_be_immutable
class ContentPage extends StatefulWidget {
  Results content;
  ContentPage(this.content);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: _getImages(widget.content),
      ),
    );
  }

  List<Widget> _getImages(Results content) {
    List<Widget> list = List<Widget>();
    
    Widget thumbnail = ImageMarvel.portraitIncredible(content.thumbnail,);
    list.add(thumbnail);

    if (content.images != null) {
      for (Thumbnail image in content.images) {
        list.add(
          ImageMarvel.portraitIncredible(
            image,
            fit: BoxFit.contain,
            )
        );
      }
    }

    return list;

  }  
}
