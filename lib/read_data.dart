import 'dart:io';

import 'package:flutter/material.dart';

class ReadData extends StatelessWidget {
  final String rNama;
  final String rnisn;
  final String rjurus;
  final File gambar;

  const ReadData({Key key, this.rNama, this.rnisn, this.rjurus, this.gambar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("Data Anggota"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: gambar == null
                    ? Text('No image selected.')
                    : Image.file(
                        gambar,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            new Row(
              children: <Widget>[
                new Text(
                  "Identitas Siswa :",
                  style: TextStyle(fontSize: 25.0, color: Colors.lightGreen),
                ),
              ],
            ),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            new Row(
              children: <Widget>[
                new Text(
                  "NISN Siswa :   " + rnisn,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            new Padding(padding: new EdgeInsets.only(top: 8.0)),
            new Row(
              children: <Widget>[
                new Text(
                  "Nama Siswa :   " + rNama,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            new Padding(padding: new EdgeInsets.only(top: 8.0)),
            new Row(
              children: <Widget>[
                new Text(
                  "Jurusan Siswa :   " + rjurus,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            new Padding(padding: new EdgeInsets.only(top: 25.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  color: Colors.grey,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(90, 30, 90, 30),
                  child: Text(
                    "Team Analis Data",
                    style: TextStyle(fontSize: 21.0),
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
