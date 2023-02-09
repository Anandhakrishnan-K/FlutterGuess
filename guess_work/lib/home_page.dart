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
        resizeToAvoidBottomInset: false,
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
        body: Column(
          children: [
            Container(
              // ignore: sort_child_properties_last
              child: Center(
                child: Text(
                  "Random Number is Generated between ${randnumin1.toString()} and ${randnumin2.toString()} \n the Number is ${randnum.toString()} and you guessed $guessed",
                ),
              ),
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: Colors.grey, blurRadius: 5.0)
                ],
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(15),
            ),
            Container(
              // ignore: sort_child_properties_last
              height: 100,
              margin: const EdgeInsets.all(50),
              child: Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: TextField(
                      onChanged: (value) => guessed = value,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: '\t\t\t\tGuess the Number',
                      ),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(20),
                      child: const Icon(Icons.mail)),
                ],
              ),
            ),
          ],
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
