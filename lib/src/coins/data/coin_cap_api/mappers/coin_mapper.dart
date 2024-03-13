import 'package:crypto_app/core/utils/converters.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/entities/coin_entity.dart';
import 'package:crypto_app/src/coins/domain/models/coin.dart';

extension CoinEntityExt on CoinEntity {
  Coin? toCoin() {
    return Coin(
        id: id,
        name: name,
        rank: int.parse(rank),
        symbol: symbol,
        imageUrl:
            "https://assets.coincap.io/assets/icons/${symbol.toLowerCase()}@2x.png",
        usdPrice: convertNumberString(priceUsd),
        convertedPrice: 0.0,
        changePercent24Hr: convertPercentString(changePercent24Hr),
        supply: supply,
        maxSupply: maxSupply,
        marketCapUsd: marketCapUsd,
        volumeUsd24Hr: volumeUsd24Hr,
        vwap24Hr: vwap24Hr,
        explorer: explorer);
  }
}

extension StringExt on String {
  String toPrice() {
    var splitValue = split('.');
    if (splitValue[0].startsWith("0")) {
      return "${splitValue[0]}.${splitValue[1].substring(0, 8)}";
    } else {
      return "${splitValue[0]}.${splitValue[1].substring(0, 2)}";
    }
  }

  String toPercent() {
    var splitValue = split('.');
    return "${splitValue[0]}.${splitValue[1].substring(0, 2)}";
  }
}
