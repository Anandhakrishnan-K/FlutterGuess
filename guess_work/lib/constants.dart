library config.globals;

import 'package:flutter/material.dart';
import 'functions.dart';

const primarycolor = Color.fromRGBO(255, 255, 0, 1);
const appbarfontcolor = Color.fromARGB(255, 0, 0, 0);
String str =
    "1.Click Start to Begin\n2.Guess the Number and Enter the number in the Input Text Box\n3.Click Check to check the Answer\n4.Click Next to mve to the next one.";
String guessed = "20";
var ranlst = [];
int randnum = 0;
int randnumin1 = 0;
int randnumin2 = 0;
final fieldText = TextEditingController();
bool totheme = false;
MyTheme currentTheme = MyTheme();
String matchMsg = '';
Color msgcol = Colors.green;
String maintext = "Click Start to Begin";
String clue1 = '';
String clue2 = '';
int score = 0;
bool ans = true;
