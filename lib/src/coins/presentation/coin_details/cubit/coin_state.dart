part of 'coin_cubit.dart';

abstract class CoinState extends Equatable {
  const CoinState();
}

class CoinInitial extends CoinState {
  @override
  List<Object?> get props => [];
}

class GettingCoin extends CoinState {
  @override
  List<Object?> get props => [];
}

class CoinLoaded extends CoinState {
  final Coin coin;

  const CoinLoaded(this.coin);

  @override
  List<Object?> get props => [coin];
}

class CoinError extends CoinState {
  final String message;
  const CoinError(this.message);
  @override
  List<Object?> get props => [message];
}

