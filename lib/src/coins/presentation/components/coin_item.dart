import 'package:crypto_app/src/coins/domain/models/coin.dart';
import 'package:crypto_app/src/coins/presentation/components/circular_image.dart';
import 'package:flutter/material.dart';

class CoinItem extends StatelessWidget {
  final Coin coin;
  const CoinItem({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircularImage(
          image: coin.imageUrl,
        ),
        title: Text(
          coin.symbol,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(coin.name),
        trailing: CoinValues(
          coin: coin,
        ));
  }
}

class CoinValues extends StatelessWidget {
  final Coin coin;
  const CoinValues({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          // ignore: prefer_adjacent_string_concatenation
          Text(
            "\$${coin.usdPrice}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(coin.changePercent24Hr),
        ]);
  }
}
