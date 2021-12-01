import 'package:flutter/cupertino.dart';

class SearchProvider extends ChangeNotifier {
  bool showResults = false;
  set showResultsValue(bool value) {
    showResults = value;
    notifyListeners();
  }
}
