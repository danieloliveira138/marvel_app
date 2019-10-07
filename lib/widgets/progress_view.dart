import 'package:flutter/material.dart';
import 'package:marvel_app/widgets/progress_bar.dart';

// ignore: must_be_immutable
class ProgressStreamBuilder extends StatefulWidget {
  Stream<bool> stream;
  ProgressStreamBuilder(this.stream);

  @override
  _ProgressStreamBuilderState createState() => _ProgressStreamBuilderState();
}

class _ProgressStreamBuilderState extends State<ProgressStreamBuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: widget.stream,
      initialData: false,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data) {
            return ProgressView();
          }
        }
        return Container();
      },
    );
  }
}


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
              child: CircleProgressBar(),
            ),
          ),
        )
      ],
    );
  }
}
