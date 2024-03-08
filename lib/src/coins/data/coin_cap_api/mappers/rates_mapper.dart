import 'package:crypto_app/core/utils/converters.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/entities/history_entity.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/entities/rate_entity.dart';
import 'package:crypto_app/src/coins/domain/models/history.dart';
import 'package:crypto_app/src/coins/domain/models/rates.dart';

extension RatesEntityExt on RateEntity {
  Rate? toRate() {
    return Rate(
      id: id,
      symbol: symbol,
      currencySymbol: currencySymbol,
      type: type,
      rateUsd: double.parse(rateUsd),
    );
  }
}
