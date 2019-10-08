import 'package:flutter/material.dart';
// ignore: must_be_immutable
class TextWithTitle extends StatelessWidget {
  String title;
  String description;

  TextWithTitle({this.title, this.description});
  @override
  Widget build(BuildContext context) {
    if (description == null || description.isEmpty) {
      return Container();
    }

    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                bottom: 8,
                right: 16,
              ),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.body1.copyWith(),
                  children: [
                      TextSpan(
                        text: '$title: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      TextSpan(
                        text: description,
                      ),
                  ],
                ),
              ),
            ),
            Divider(),
        ],
    );
  }
}