import 'package:crypto_app/core/extensions/context_extensions.dart';
import 'package:crypto_app/src/coins/domain/models/coin.dart';
import 'package:crypto_app/src/coins/presentation/coin_list/cubit/coins_cubit.dart';
import 'package:crypto_app/src/coins/presentation/components/coin_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinsScreen extends StatefulWidget {
  const CoinsScreen({super.key});

  static const routeName = '/';

  @override
  State<CoinsScreen> createState() => _CoinsScreenState();
}

class _CoinsScreenState extends State<CoinsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CoinsCubit>().getAllCoins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CoinsCubit, CoinsState>(
        listener: (BuildContext context, CoinsState state) {},
        builder: (BuildContext context, CoinsState state) {
          if (state is GettingCoins) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  context.theme.colorScheme.secondary,
                ),
              ),
            );
          }

          if (state is CoinsLoaded) {
            return CoinList(coins: state.coins);
          }

          if (state is CoinsError) {
            return Center(
              child: Text(state.message),
            );
          }

          return const Placeholder();
        },
      ),
    );
  }
}

class CoinList extends StatelessWidget {
  final List<Coin> coins;

  const CoinList({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<CoinsCubit>().getAllCoins();
          },
          child: ListView.builder(
            itemCount: coins.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CoinItem(coin: coins[index]);
            },
          ),
        ));
  }
}
