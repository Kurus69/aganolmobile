import 'package:flutter/material.dart';

class EditList extends StatefulWidget {
  final String oldNama;
  final String oldnisn;
  final String oldjurusan;

  const EditList({Key key, this.oldNama, this.oldnisn, this.oldjurusan})
      : super(key: key);

  @override
  _EditListState createState() => _EditListState();
}

class _EditListState extends State<EditList> {
  TextEditingController txtNama;
  TextEditingController nisntxt;

  String _jurusansiswa;
  String odl;
  void oldData() {
    txtNama = TextEditingController(text: widget.oldNama);
    nisntxt = TextEditingController(text: widget.oldnisn);

    odl = widget.oldjurusan;
  }

  List _prodi = [
    "Rekaya Perangkat Lunak",
    "Multimedia",
    "Tata Niaga",
    "Otomotif",
    "Kesenian"
  ];

  void simpanData() {
    Navigator.pop(context, {
      'nama': txtNama.text,
      'nisn': nisntxt.text,
      'jurusan': _jurusansiswa == null ? odl : _jurusansiswa
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oldData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Anggota"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.fromLTRB(5.0, 100.0, 5.0, 5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
          Radius.circular(15),
        )),
        child: Column(
          children: [
            TextField(
              controller: nisntxt,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  hintText: "NISN Siswa",
                  labelText: "NISN",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0))),
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
                  hint: Text((odl == null) ? 'Pilih' : '$odl'),
                ),
              ],
            ),
            new Padding(padding: new EdgeInsets.only(top: 30.0)),
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
