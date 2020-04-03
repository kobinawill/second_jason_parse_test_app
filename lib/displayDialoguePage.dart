import 'package:flutter/material.dart';

void showDBox(BuildContext context, String content){
  var alert = new AlertDialog(
    title: new Text("My Own Json App"),
    content: new Text(content),
    actions: <Widget>[
      new FlatButton(onPressed: () => Navigator.pop(context),
          child: new Text("Ok"))
    ],
  );
  showDialog(context: context, builder: (context) => alert);
}