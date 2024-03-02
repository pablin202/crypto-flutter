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
        usdPrice: priceUsd!.toPrice(),
        changePercent24Hr: changePercent24Hr!.toPercent());
  }
}

extension StringExt on String {
  String toPrice() {
    var splitedValue = split('.');
    if (splitedValue[0].startsWith("0")) {
      return "${splitedValue[0]}.${splitedValue[1].substring(0, 6)}";
    } else {
      return "${splitedValue[0]}.${splitedValue[1].substring(0, 2)}";
    }
  }

  String toPercent() {
    var splitedValue = split('.');
    return "${splitedValue[0]}.${splitedValue[1].substring(0, 2)}";
  }
}
