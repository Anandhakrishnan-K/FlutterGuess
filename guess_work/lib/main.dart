import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(guess());
}

class guess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text(
            "Guess Work",
            style: const TextStyle(color: appbarfontcolor),
          ),
          centerTitle: true,
          backgroundColor: primarycolor,
        ),
      ),
    );
  }
}
