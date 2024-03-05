import 'package:crypto_app/core/utils/typedefs.dart';
import 'package:crypto_app/src/coins/domain/models/coin.dart';
import 'package:crypto_app/src/coins/domain/models/history.dart';

abstract class CoinsRepository {
  const CoinsRepository();

  ResultFuture<List<Coin>> getCoins();
  ResultFuture<Coin> getCoinById(String id);
  ResultFuture<List<History>> getHistoryById(String id, String interval, int start, int end);
}

