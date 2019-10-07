import 'package:flutter/material.dart';
import 'package:marvel_app/models/results.dart';

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
      body: Container(),
    );
  }
}
