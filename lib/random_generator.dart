import 'dart:math';

import 'package:flutter/material.dart';

class RandomizeChangeNotifier extends ChangeNotifier {

  final random = Random();
  
  int? _randomNumber;

  get randomNumber => _randomNumber;

  int min = 0;
  int max = 0;

  generateRandomNumber(){

    _randomNumber = min + random.nextInt(max + 1 - min);
    notifyListeners();
  }

}
