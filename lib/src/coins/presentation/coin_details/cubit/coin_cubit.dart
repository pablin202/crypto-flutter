import 'package:bloc/bloc.dart';
import 'package:crypto_app/src/coins/domain/models/coin.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_coin_by_id.dart';
import 'package:equatable/equatable.dart';

part 'coin_state.dart';

class CoinCubit extends Cubit<CoinState> {
  CoinCubit(
      {required GetCoinById getCoinById,})
      : _getCoinById = getCoinById,
        super(CoinInitial());

  final GetCoinById _getCoinById;

  Future<void> getCoinById(String id) async {
    emit(GettingCoin());
    final result = await _getCoinById(GetCoinByIdParams(id: id));

    result.fold((failure) => emit(CoinError(failure.toString())), (coin) {
      emit(CoinLoaded(coin));
    });
  }
}
