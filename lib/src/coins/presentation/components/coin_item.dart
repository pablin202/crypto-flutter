import 'package:crypto_app/src/coins/domain/models/coin.dart';
import 'package:crypto_app/src/coins/presentation/coin_details/navigation/coin_details_args.dart';
import 'package:crypto_app/src/coins/presentation/coin_details/views/coin_screen.dart';
import 'package:crypto_app/src/coins/presentation/components/circular_image.dart';
import 'package:flutter/material.dart';

class CoinItem extends StatelessWidget {
  final Coin coin;

  const CoinItem({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            CoinScreen.routeName,
            arguments: CoinDetailsScreenArguments(
              coin.id,
              coin.name
            ),
          );
        },
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

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (coin.changePercent24Hr.startsWith("-"))
                Icon(
                  Icons.trending_down,
                  color: Colors.red.shade400,
                  size: 12.0,
                  semanticLabel: 'down',
                ),
              if (coin.changePercent24Hr.startsWith("-"))
                Text(
                  "${coin.changePercent24Hr}%",
                  style: TextStyle(color: Colors.red.shade400),
                ),
              if (!coin.changePercent24Hr.startsWith("-"))
                Icon(
                  Icons.trending_up_rounded,
                  color: Colors.green.shade400,
                  size: 12.0,
                  semanticLabel: 'up',
                ),
              if (!coin.changePercent24Hr.startsWith("-"))
                Text(
                  "${coin.changePercent24Hr}%",
                  style: TextStyle(color: Colors.green.shade400),
                )
            ],
          )
        ]);
  }
}
