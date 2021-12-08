import 'package:flutter/cupertino.dart';

class SearchContactProvider extends ChangeNotifier {
  bool showResults = false;
  set showResultsValue(bool value) {
    showResults = value;
    notifyListeners();
  }
}
