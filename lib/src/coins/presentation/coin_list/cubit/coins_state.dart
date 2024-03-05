part of 'coins_cubit.dart';

abstract class CoinsState extends Equatable {
  const CoinsState();
}

class CoinsInitial extends CoinsState {
  @override
  List<Object?> get props => [];
}

class GettingCoins extends CoinsState {
  @override
  List<Object?> get props => [];
}

class CoinsLoaded extends CoinsState {
  final List<Coin> coins;

  const CoinsLoaded(this.coins);

  @override
  List<Object?> get props => coins.map((e) => e.id).toList();
}

class CoinsError extends CoinsState {
  final String message;
  const CoinsError(this.message);
  @override
  List<Object?> get props => [message];
}
