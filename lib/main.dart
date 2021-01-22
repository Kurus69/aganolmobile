import 'package:flutter/material.dart';
import 'package:Aganol/home.dart';

void main() => runApp(Aganol());

class Aganol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homeapl(),
    );
  }
}
