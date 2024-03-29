import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProgressCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 8,
      child: Container(
        height: 250,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
