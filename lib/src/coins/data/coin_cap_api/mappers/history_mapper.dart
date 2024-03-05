import 'package:crypto_app/src/coins/data/coin_cap_api/entities/history_entity.dart';
import 'package:crypto_app/src/coins/domain/models/history.dart';

extension HistoryEntityExt on HistoryEntity {
  History? toHistory() {
    return History(priceUsd: priceUsd, time: time, date: date);
  }
}
