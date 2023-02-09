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
          // leading: IconButton(
          //   icon: const Icon(Icons.arrow_back),
          //   onPressed: () {},
          // ),
          foregroundColor: Colors.black,
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
        body: Center(
          child: Text(
            str,
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
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
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () {
                  setState(() {
                    scount += 1;
                    str =
                        ("Settings Button has been Pressed ${scount.toString()} time(s)");
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text("Help"),
                onTap: () {
                  setState(() {
                    hcount += 1;
                    str =
                        ("Help Button has been Pressed ${hcount.toString()} time(s)");
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.warning_rounded),
                title: const Text("About"),
                onTap: () {
                  setState(() {
                    acount += 1;
                    str =
                        ("About Button has been Pressed ${acount.toString()} time(s)");
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.mail),
                title: const Text("Contact Us"),
                onTap: () {
                  setState(() {
                    ccount += 1;
                    str =
                        ("Contact Us Button has been Pressed ${ccount.toString()} time(s)");
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
