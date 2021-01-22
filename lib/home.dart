import 'package:flutter/material.dart';
import 'package:Aganol/nav.dart';

class Homeapl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aganol'),
        backgroundColor: Colors.lightGreen,
      ),
      drawer: DrawerWidget(),
      body: new Container(
        padding: new EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 15.0),
        child: new ListView(
          children: <Widget>[
            new Text("Aplikasi Magang Online",
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.lightGreen,
                    fontWeight: FontWeight.bold)),
            new Padding(padding: new EdgeInsets.only(top: 15.0, bottom: 10.0)),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            new Image(image: AssetImage("assets/images/work.png")),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            new Image(image: AssetImage("assets/images/team.png")),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            new Image(image: AssetImage("assets/images/task.png")),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            new Image(image: AssetImage("assets/images/project.png")),
          ],
        ),
      ),
    );
  }
}
