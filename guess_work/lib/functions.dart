import 'dart:math';
import 'constants.dart';

randgen() {
  Random random = Random();
  var lst = [];
  int a = random.nextInt(80);
  lst.add(a);
  int randomNumber = random.nextInt(20) + a;
  lst.add(randomNumber);
  return lst;
}

void clearText() {
  fieldText.clear();
}
