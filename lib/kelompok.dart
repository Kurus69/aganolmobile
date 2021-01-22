import 'package:flutter/material.dart';
import 'package:Aganol/edit_list.dart';
import 'package:Aganol/nav.dart';
import 'package:Aganol/read_data.dart';
import 'package:Aganol/tambah_data.dart';

class ApkHome extends StatefulWidget {
  @override
  _ApkHomeState createState() => _ApkHomeState();
}

class _ApkHomeState extends State<ApkHome> {
  List<Map<String, dynamic>> dataBase = List();

  void tambahData() async {
    final hasil = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => TambahData()));
    if (hasil != null) {
      dataBase.add({
        'nama': hasil['nama'],
        'nisn': hasil['nisn'],
        'jurusan': hasil['jurusan'],
        'image': hasil['image']
      });
      setState(() {});
    }
  }

  void editData(int indek) async {
    final old = dataBase[indek];
    final edit = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditList(
                  oldNama: old['nama'],
                  oldnisn: old['nisn'],
                  oldjurusan: old['jurusan'],
                )));
    if (edit != null) {
      dataBase.remove(old);
      dataBase.insert(indek, {
        'nama': edit['nama'],
        'nisn': edit['nisn'],
        'jurusan': edit['jurusan'],
      });
      setState(() {});
    }
  }

  void readData(int indek) {
    final old = dataBase[indek];
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ReadData(
                  rNama: old['nama'],
                  rnisn: old['nisn'],
                  rjurus: old['jurusan'],
                  gambar: old['image'],
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Aganol'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        onPressed: () {
          tambahData();
        },
        child: Icon(Icons.add),
      ),
      drawer: DrawerWidget(),
      body: ListView.builder(
          itemCount: dataBase.length,
          itemBuilder: (context, i) {
            final data = dataBase[i];
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0), spreadRadius: 0, blurRadius: 1)
                ],
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(width: 2, color: Colors.white))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              editData(i);
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.library_books_outlined,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              readData(i);
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.delete_forever,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                dataBase.removeAt(i);
                              });
                            }),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 2, color: Colors.white),
                          ),
                        ),
                        child: Text(
                          data['nama'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data['nisn'],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              data['jurusan'],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
