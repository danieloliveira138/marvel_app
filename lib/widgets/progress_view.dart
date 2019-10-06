import 'package:flutter/material.dart';

class ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.black45,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        )
      ],
    );
  }
}
