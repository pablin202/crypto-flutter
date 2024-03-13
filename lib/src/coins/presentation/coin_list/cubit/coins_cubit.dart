import 'package:bloc/bloc.dart';
import 'package:crypto_app/core/extensions/context_extensions.dart';
import 'package:crypto_app/core/utils/converters.dart';
import 'package:crypto_app/src/coins/domain/models/coin.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_all_coins.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_prefer_rate.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'coins_state.dart';

class CoinsCubit extends Cubit<CoinsState> {
  CoinsCubit(
      {required GetAllCoins getAllCoins, required GetPreferRate getPreferRate})
      : _getAllCoins = getAllCoins,
        _getPreferRate = getPreferRate,
        super(CoinsInitial());

  final GetAllCoins _getAllCoins;
  final GetPreferRate _getPreferRate;

  Future<void> setPreferCoin(BuildContext context) async {
    final result = await _getPreferRate();
    result.fold((failure) => {}, (rate) {
      context.rateProvider.initDefaultRate(rate);
    });
  }

  Future<void> getAllCoins(double priceRate) async {
    emit(GettingCoins());
    final result = await _getAllCoins();
    result.fold((failure) => emit(CoinsError(failure.toString())), (coins) {
      var convertedCoins = coins
          .map((e) => e.copyWith(
              convertedPrice:
                  convertNumberString((e.usdPrice * priceRate).toString())))
          .toList();
      emit(CoinsLoaded(convertedCoins));
    });
  }
}
