import 'package:crypto_app/core/extensions/context_extensions.dart';
import 'package:crypto_app/src/coins/domain/models/coin.dart';
import 'package:crypto_app/src/coins/domain/models/value_style.dart';
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
                coin.name,
                coin.imageUrl
            ),
          );
        },
        leading: Hero(
          tag: 'coin_image',
          child: CircularImage(
            image: coin.imageUrl,
          ),
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
    var valueStyle = (coin.changePercent24Hr < 0)
        ? ValueStyle.negative()
        : ValueStyle.positive();

    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          // ignore: prefer_adjacent_string_concatenation
          Text(
            "${context.defaultRate?.currencySymbol}${coin.convertedPrice}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                valueStyle.icon,
                color: valueStyle.color,
                size: 12.0,
                semanticLabel: 'icon_value',
              ),
              Text(
                "${coin.changePercent24Hr}%",
                style: TextStyle(color: valueStyle.color),
              ),
            ],
          )
        ]);
  }
}
