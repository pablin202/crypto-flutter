import 'package:crypto_app/core/utils/typedefs.dart';
import 'package:crypto_app/src/coins/domain/models/coin.dart';

abstract class CoinsRepository {
  const CoinsRepository();

  ResultFuture<List<Coin>> getCoins();
}
