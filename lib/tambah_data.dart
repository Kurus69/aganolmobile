import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class TambahData extends StatefulWidget {
  @override
  _TambahDataState createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  TextEditingController txtNama = TextEditingController();
  TextEditingController nisntxt = TextEditingController();
  String _jurusansiswa;
  List _prodi = [
    "Rekaya Perangkat Lunak",
    "Multimedia",
    "Tata Niaga",
    "Otomotif",
    "Kesenian"
  ];
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void simpanData() {
    Navigator.pop(context, {
      'nama': txtNama.text,
      'nisn': nisntxt.text,
      'jurusan': _jurusansiswa == null ? 'Kosong' : _jurusansiswa,
      'image': _image
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("Tambah Anggota"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
          Radius.circular(15),
        )),
        child: ListView(
          children: [
            new Image(image: AssetImage("assets/images/team.png")),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            TextField(
              controller: nisntxt,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  hintText: "NISN Siswa",
                  labelText: "NISN",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  )),
            ),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            TextField(
              controller: txtNama,
              decoration: new InputDecoration(
                  hintText: "Nama Lengkap",
                  labelText: "Nama",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0))),
            ),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            Row(
              children: <Widget>[
                new Text(
                  "Jurusan   : ",
                  style: new TextStyle(fontSize: 20.0, color: Colors.grey),
                ),
                DropdownButton(
                  items: _prodi.map((value) {
                    return DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _jurusansiswa = value;
                    });
                  },
                  value: _jurusansiswa,
                  hint: Text('Pilih'),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Foto KTP : ",
                  style: new TextStyle(fontSize: 20.0, color: Colors.grey),
                ),
                FlatButton(
                  onPressed: getImage,
                  child: _image == null
                      ? Text('Pilih File')
                      : Text('Berhasil Diupload'),
                )
              ],
            ),
            new Padding(padding: new EdgeInsets.only(top: 35.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  color: Colors.lightGreen,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                  child: Text("Simpan"),
                  onPressed: () {
                    simpanData();
                  },
                ),
                RaisedButton(
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Batal'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
