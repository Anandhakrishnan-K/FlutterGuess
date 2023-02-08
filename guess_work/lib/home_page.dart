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
          title: Text("Guess Work"),
          centerTitle: true,
          backgroundColor: primarycolor,
          // leading: IconButton(
          //   icon: const Icon(Icons.arrow_back),
          //   onPressed: () {},
          // ),
          foregroundColor: appbarfontcolor,
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            )
          ],
          toolbarHeight: 60,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.purpleAccent,
              Colors.pinkAccent,
              Colors.red
            ])),
          ),
        ),
        body: const Center(
          child: Text(
            "This is the Main Page",
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: const [
              UserAccountsDrawerHeader(
                accountName: Text("Anandhakrishnan"),
                accountEmail: Text("kanandhakrishnan133@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("AK"),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.purpleAccent, Colors.red],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
              ),
              ListTile(title: Text("Settings"), leading: Icon(Icons.settings)),
            ],
          ),
        ),
      ),
    );
  }
}
