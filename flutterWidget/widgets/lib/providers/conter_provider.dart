import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  var count = 0;

  void increase() {
    count = count + 1;
    notifyListeners();
  }
}
