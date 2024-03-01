import 'package:crypto_app/src/coins/data/entities/coin_entity.dart';
import 'package:crypto_app/src/coins/domain/models/coin.dart';

extension CoinEntityExt on CoinEntity? {
  Coin? toCoin() {
    if (this == null) return null;

    return Coin(
        id: this!.id,
        isActive: this!.isActive,
        isNew: this!.isNew,
        name: this!.name,
        rank: this!.rank,
        symbol: this!.symbol,
        type: this!.type);
  }
}
