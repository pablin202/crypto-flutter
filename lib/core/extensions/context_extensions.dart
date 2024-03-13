import 'package:crypto_app/core/common/app/providers/rate_provider.dart';
import 'package:crypto_app/src/coins/domain/models/rates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;

  double get width => size.width;

  RateProvider get rateProvider => read<RateProvider>();

  Rate? get defaultRate => rateProvider.rate;

  double get height => size.height;

  bool get mounted {
    try {
      widget;
      return true;
    } catch (e) {
      return false;
    }
  }
}
