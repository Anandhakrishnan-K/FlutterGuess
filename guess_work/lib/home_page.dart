import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'functions.dart';

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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text(
            "Guess Work",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
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
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  // ignore: sort_child_properties_last
                  child: Center(
                    child: Text(
                      "Random Number was Generated between ${randnumin1.toString()} and ${randnumin2.toString()}",
                    ),
                  ),
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  margin: const EdgeInsets.all(15),
                ),
                Container(
                  // ignore: sort_child_properties_last
                  height: 70,
                  margin: const EdgeInsets.only(left: 50, top: 15),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 150,
                        height: 60,
                        child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value) => guessed = value,
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              //hintText: 'Guess the Number',
                              labelText: 'Guess the Number',
                              labelStyle: const TextStyle(fontSize: 15)),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: fieldText,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 30),
                        child: SizedBox(
                          width: 100,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(colors: [
                                  Colors.purpleAccent,
                                  Colors.redAccent
                                ])),
                            child: TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.black,
                                ),
                                onPressed: clearText,
                                child: const Text(
                                  'Clear',
                                  style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
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
