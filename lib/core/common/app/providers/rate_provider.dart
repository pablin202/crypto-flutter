import 'package:crypto_app/src/coins/domain/models/rates.dart';
import 'package:flutter/material.dart';

class RateProvider extends ChangeNotifier {
  late Rate _rate;

  Rate get rate => _rate;

  void initUser(Rate? rate){
    if (_rate != rate) _rate = rate!;
  }

  set user(Rate? rate){
    if (_rate != rate) {
      _rate = rate!;
      Future.delayed(Duration.zero, notifyListeners);
    }
  }
}