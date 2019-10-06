import 'package:flutter/material.dart';
import 'package:marvel_app/models/items.dart';

class CustomListTile extends StatelessWidget {
  Items items;
  String label;
  CustomListTile({this.items, this.label});

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
              onTap: () {

              },
            )
          ],
        ),
    );
  }
}
