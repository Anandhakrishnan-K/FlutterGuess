import 'dart:math';
import 'package:flutter/material.dart';
import 'constants.dart';

randgen() {
  Random random = Random();
  var lst = [];
  int a = random.nextInt(8) * 10;
  lst.add(a);
  int randomNumber = random.nextInt(20) + a;
  lst.add(randomNumber);
  return lst;
}

void setRand() {
  ranlst = randgen();
  randnum = ranlst.last;
  randnumin1 = ranlst.first;
  randnumin2 = randnumin1 + 20;
  maintext =
      "There is one Random Number Generated between ${randnumin1.toString()} and ${randnumin2.toString()}.\n\n Guess the Number ....";
  setclue1(randnum);
  setclue2(randnum);
}

void clearText() {
  fieldText.clear();
}

class MyTheme with ChangeNotifier {
  bool isdark = false;

  ThemeMode currentTheme() {
    return isdark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    isdark = !isdark;
    notifyListeners();
  }
}

void setclue1(int n) {
  int n1 = n;
  int tmp = 0;
  while (n1 > 0) {
    tmp = n1 % 10;
    n1 = n1 ~/ 10;
  }
  clue1 = "\nThe Random Number generated starting with: ${tmp.toString()} ";
}

void setclue2(int n) {
  var tlst = [];
  for (int i = 2; i < n / 2; i++) {
    if (n % i == 0) {
      tlst.add(i);
    }
    if (tlst.isEmpty) {
      clue2 = "\nAnd its a Prime Number";
    } else {
      clue2 = "\nAnd the Number is Multiples of ${tlst.join(',')}";
    }
  }
}
