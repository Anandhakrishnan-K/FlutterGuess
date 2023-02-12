import 'package:flutter/foundation.dart';
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
  initstate() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
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
              icon: totheme
                  ? const Icon(Icons.brightness_4_rounded)
                  : const Icon(Icons.brightness_4_outlined),
              onPressed: () {
                setState(() {
                  totheme = !totheme;
                  currentTheme.switchTheme();
                });
              },
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
                      "There is one Random Number Generated between ${randnumin1.toString()} and ${randnumin2.toString()}.\n\n Guess the Number ....",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  height: 150,
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                  ),
                ),
                Container(
                  // ignore: sort_child_properties_last
                  height: 100,
                  margin: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: SizedBox(
                          width: 200,
                          height: 70,
                          child: TextField(
                            maxLength: 2,
                            textAlign: TextAlign.center,
                            onChanged: (value) => guessed = value,
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
                                suffixIcon: const IconButton(
                                    onPressed: clearText,
                                    icon: Icon(Icons.cancel_outlined)),
                                counterText: '',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                //hintText: 'Guess the Number',
                                labelText: 'Guess the Number',
                                labelStyle: const TextStyle(fontSize: 15)),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            controller: fieldText,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SizedBox(
                          width: 100,
                          height: 50,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(colors: [
                                  Colors.purpleAccent,
                                  Colors.redAccent
                                ])),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  (int.parse(guessed) == randnum)
                                      ? {
                                          matchMsg =
                                              "Congratulations !!! You Guessed it Correctly, Moving on to the next one.",
                                          setRand()
                                        }
                                      : matchMsg =
                                          "Oops !!! You made a wrong Guess. Try Again..";
                                  clearText();
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purpleAccent,
                                  foregroundColor: Colors.black),
                              child: const Text(
                                'Next',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Center(
                    child: SizedBox(
                      width: 120,
                      height: 50,
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
                            onPressed: () {
                              setState(() {
                                clearText();
                                setRand();
                                if (kDebugMode) {
                                  print(randnum);
                                }
                              });
                            },
                            child: const Text(
                              'Start ',
                              style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
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
