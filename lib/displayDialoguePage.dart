import 'package:flutter/material.dart';
import 'main.dart' as guy;

void showDBox(BuildContext context, String content, int heyYou) async {
  List newMe = await guy.getJasonStuff();

  var alert = new AlertDialog(
    title: new Text("${newMe[heyYou]['name']}\'s City"),
    content: new Text(content),
    actions: <Widget>[
      new FlatButton(onPressed: () => Navigator.pop(context),
          child: new Text("Ok"))
    ],
  );
  showDialog(context: context, builder: (context) => alert);
}