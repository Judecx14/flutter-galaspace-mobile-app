import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedOptionMenu = 0;

  int get selectedOptionMenu {
    return _selectedOptionMenu;
  }

  set selectedOptionMenu(int index) {
    _selectedOptionMenu = index;
    notifyListeners();
  }
}
