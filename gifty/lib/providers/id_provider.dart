import 'package:flutter/material.dart';

class IdProvider extends ChangeNotifier {
  int _id = 1;

  int get id => _id;

  void setId(int id) {
    _id = id;
    notifyListeners();
  }
}

final IdProvider idProvider = IdProvider();
