import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{
  int _counter = 0;
  List<Map<String, dynamic>> mData = [];
  ///add, update, delete and get

  /// events
  void incrementCount(){
    _counter++;
    notifyListeners();
  }

  int getCounterValue(){
    return _counter;
  }

  void decrementCount(){
    if(_counter>0) {
      _counter--;
      notifyListeners();
    }
  }
}