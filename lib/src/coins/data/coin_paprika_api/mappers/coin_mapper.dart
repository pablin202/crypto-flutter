import 'package:crypto_app/src/coins/data/coin_paprika_api/entities/coin_entity.dart';
import 'package:crypto_app/src/coins/domain/models/coin.dart';

extension CoinEntityExt on CoinEntity? {
  Coin? toCoin() {
    if (this == null) return null;

    return Coin(
        id: this!.id,
        name: this!.name,
        rank: this!.rank,
        symbol: this!.symbol,
        imageUrl:
            "https://assets.coincap.io/assets/icons/${this!.symbol.toLowerCase()}@2x.png",
        usdPrice: 0.0,
        convertedPrice: 0.0,
        changePercent24Hr: 0.0,
        supply: "",
        maxSupply: "",
        marketCapUsd: "",
        volumeUsd24Hr: "",
        vwap24Hr: "",
        explorer: "");
  }
}
