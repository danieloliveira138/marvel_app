import 'package:flutter/material.dart';
import 'package:marvel_app/models/items.dart';

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  Items items;
  String label;
  Function function;
  CustomListTile({this.items, this.label, this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(label,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            ListTile(
              title: Text(items.name),
              subtitle: Text(items.resourceURI),
              onTap: () => function(),
            )
          ],
        ),
    );
  }
}
