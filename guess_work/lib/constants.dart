import 'dart:math';
import 'package:flutter/material.dart';

const primarycolor = Color.fromRGBO(255, 255, 0, 1);
const appbarfontcolor = Color.fromARGB(255, 0, 0, 0);
String str = "Work Under Progress";
String guessed = "";
int scount = 0;
int hcount = 0;
int acount = 0;
int ccount = 0;
var ranlst = randgen();
int randnum = ranlst.last;
int randnumin1 = ranlst.first;
int randnumin2 = randnumin1 + 20;
randgen() {
  Random random = Random();
  var lst = [];
  int a = random.nextInt(80) + 10;
  lst.add(a);
  int randomNumber = random.nextInt(a + 20) + a;
  lst.add(randomNumber);
  return lst;
}
