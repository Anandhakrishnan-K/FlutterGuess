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
