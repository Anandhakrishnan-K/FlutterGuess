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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // ignore: sort_child_properties_last
                    child: Column(
                      children: [
                        Text(
                          maintext,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          clue1,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          clue2,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
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
                                    if (int.parse(guessed) == randnum) {
                                      matchMsg =
                                          "Congratulations !!! You Guessed it Correctly,\nClick next to move to the next one...";
                                      msgcol = Colors.green;
                                      ans = true;
                                      score++;
                                    } else {
                                      matchMsg =
                                          "Oops !!! You made a wrong Guess. Try Again..";
                                      msgcol = Colors.red;
                                      ans = false;
                                      score = 0;
                                    }
                                    clearText();
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purpleAccent,
                                    foregroundColor: Colors.black),
                                child: const Text(
                                  'Check',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 25),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Current Streak: ${score.toString()}",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 120,
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
                                if (kDebugMode) {
                                  print(ans);
                                }
                                setState(() {
                                  clearText();
                                  if (ans == true) {
                                    setRand();
                                    ans = false;
                                    matchMsg = '';
                                  } else {
                                    matchMsg =
                                        "Guess the correct number to move to the next one...";
                                    msgcol = Colors.red;
                                  }
                                  if (kDebugMode) {
                                    print(randnum);
                                  }
                                });
                              },
                              child: Text(
                                (score == 0) ? 'Start' : 'Next',
                                style: const TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: Center(
                      child: SizedBox(
                        height: 50,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            matchMsg,
                            style: TextStyle(
                              color: msgcol,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 200,
                        margin: const EdgeInsets.all(15),
                        child: SizedBox(
                          child: InputDecorator(
                            decoration: InputDecoration(
                                labelText: "How To Play:",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                str,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
