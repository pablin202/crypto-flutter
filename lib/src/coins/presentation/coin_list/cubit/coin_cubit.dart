import 'package:bloc/bloc.dart';
import 'package:crypto_app/src/coins/domain/models/coin.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_all_coins.dart';
import 'package:equatable/equatable.dart';

part 'coin_state.dart';

class CoinsCubit extends Cubit<CoinsState> {
  CoinsCubit({required GetAllCoins getAllCoins})
      : _getAllCoins = getAllCoins,
        super(CoinsInitial());

  final GetAllCoins _getAllCoins;

  Future<void> getAllCoins() async {
    emit(GettingCoins());
    final result = await _getAllCoins();

    result.fold((failure) => emit(CoinsError(failure.toString())), (coins) {
      emit(CoinsLoaded(coins));
    });
  }
}
