import 'package:flutter/material.dart';

class ToCodeVariables extends ChangeNotifier {
  //small letters
  bool _isClicked_SmallLetters = true;
  bool get isClicked_SmallLetters => _isClicked_SmallLetters;

  void updateSmallLetters(isClicked_SmallLetters) {
    _isClicked_SmallLetters = isClicked_SmallLetters;
    notifyListeners();
  }

  //capitalletters
  bool _isClicked_CapitalLetters = true;
  bool get isClicked_CapitalLetters => _isClicked_CapitalLetters;

  void updateCapitalLetters(isClicked_CapitalLetters) {
    _isClicked_CapitalLetters = isClicked_CapitalLetters;
    notifyListeners();
  }

  //numbers
  bool _isClicked_Numbers = true;
  bool get isClicked_Numbers => _isClicked_Numbers;

  void updateNumbers(isClicked_Numbers) {
    _isClicked_Numbers = isClicked_Numbers;
    notifyListeners();
  }

  //symbols

  bool _isClicked_Symbols = true;
  bool get isClicked_Symbols => _isClicked_Symbols;

  void updateSymbols(isClicked_Symbols) {
    _isClicked_Symbols = isClicked_Symbols;
    notifyListeners();
  }

  //lenght

  int _l = 15;
  int get l => _l;

  void updatel(l) {
    if (l < 5) {
      // Make 5 the minimum
      l = 5;
    }
    if (l > 100000) {
      // Makes 100000 the maximum
      l = 100000;
    }
    _l = l;

    notifyListeners();
  }

  // symbolsmanagenment

  String _SymbolsValue = '@!#{}[]":%^&*()';
  String get SymbolsValue => _SymbolsValue;

  void updateSymbolsValue(SymbolsValue) {
    _SymbolsValue = SymbolsValue;
    notifyListeners();
  }
}
