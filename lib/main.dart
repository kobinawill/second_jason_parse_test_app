import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'displayDialoguePage.dart' as display;



void main() async {
  List _data = await getJasonStuff();
    runApp(new MaterialApp(
      title: "JSON Parse",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("My Own JSON Parse App"),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
        ),
        body: new Center(
          child: new ListView.builder(
              itemCount: _data.length,
              itemBuilder: (BuildContext context, int indexValue ){
                return new Column(
                  children: <Widget>[
                    new Divider(height: 5.5,),
                    new ListTile(
                      title: new Text(_data[indexValue]['name']),
                      subtitle: new Text(_data[indexValue]['address']['street']),
                      leading: new CircleAvatar(
                        child: new Text("${_data[indexValue]['id']}"),
                        backgroundColor: Colors.pinkAccent,
                      ),
                      onTap: () => display.showDBox(context, _data[indexValue]['address']['city'], indexValue),
                    )
                  ],
                );

          })
        ),
      )
    ));
}

Future<List> getJasonStuff() async{
    http.Response theResponse = await http.get("http://jsonplaceholder.typicode.com/users");
    return json.decode(theResponse.body);
}

