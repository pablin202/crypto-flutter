import 'package:crypto_app/core/constants/common_values.dart';
import 'package:crypto_app/core/extensions/context_extensions.dart';
import 'package:crypto_app/core/services/injection_container.dart';
import 'package:crypto_app/src/coins/domain/models/coin.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_rate_by_id.dart';
import 'package:crypto_app/src/coins/presentation/coin_list/cubit/coins_cubit.dart';
import 'package:crypto_app/src/coins/presentation/components/coin_item.dart';
import 'package:crypto_app/src/coins/presentation/components/search_bar.dart';
import 'package:crypto_app/src/settings/presentation/views/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

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
    context
        .read<CoinsCubit>()
        .setPreferCoin(context)
        .then((value) => initialization(() {
              context
                  .read<CoinsCubit>()
                  .getAllCoins(context.defaultRate!.rateUsd);
            }));
  }

  void initialization(Function callback) async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    if (context.mounted) {
      if (context.defaultRate?.id != defaultRateId) {
        var result = await GetRateById(sl())
            .call(GetRateByIdParams(id: context.defaultRate!.id));
        result.fold((failure) => {}, (rate) {
          context.rateProvider.rate = rate;
        });
      }
    }

    callback();

    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  void onQueryChanged(String query) {
    context.read<CoinsCubit>().filterCoins(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AdiCoinify"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SettingsScreen.routeName);
              },
              icon: const Icon(Icons.settings))
        ],
      ),
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
            return CoinList(
              coins: state.coins,
              onQueryChanged: onQueryChanged,
            );
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
  final void Function(String) onQueryChanged;

  final List<Coin> coins;

  const CoinList(
      {super.key, required this.coins, required this.onQueryChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(child: SearchInput(onQueryChanged: onQueryChanged)),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  context
                      .read<CoinsCubit>()
                      .getAllCoins(context.defaultRate!.rateUsd);
                },
                child: ListView.builder(
                  itemCount: coins.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CoinItem(coin: coins[index]);
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
