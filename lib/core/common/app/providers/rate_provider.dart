import 'package:crypto_app/src/coins/domain/models/rates.dart';
import 'package:flutter/material.dart';

class RateProvider extends ChangeNotifier {
  Rate? _rate;

  Rate? get rate => _rate;

  void initDefaultRate(Rate? rate){
    if (_rate != rate) _rate = rate!;
  }

  set rate(Rate? rate){
    if (_rate != rate) {
      _rate = rate!;
      Future.delayed(Duration.zero, notifyListeners);
    }
  }
}