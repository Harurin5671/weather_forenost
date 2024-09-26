import 'package:flutter/material.dart';

class ListProvider with ChangeNotifier {
  List<Map> list = [];
  int index = 0;
  
  void addItem(Map item) {
    list.add(item);
    notifyListeners();
  }

  void updateIndex(int index) {
    this.index = index;
    notifyListeners();
  }
}