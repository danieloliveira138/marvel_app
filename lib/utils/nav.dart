import 'package:flutter/material.dart';

nav(BuildContext context, Widget page, {bool replace = false}) {
  if (replace) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
    return;
  }

  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));

}

pop (context) {
  Navigator.pop(context);
}