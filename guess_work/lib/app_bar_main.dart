import 'package:flutter/material.dart';

import 'constants.dart';

class GuessAppBar extends StatefulWidget {
  const GuessAppBar({super.key});

  @override
  State<GuessAppBar> createState() => _GuessState();
}

class _GuessState extends State<GuessAppBar> {
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
