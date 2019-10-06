import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CircleProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitPouringHourglass(
        color: Colors.red,
    );
  }
}
