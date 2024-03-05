import 'package:crypto_app/core/usecases/usecases.dart';
import 'package:crypto_app/core/utils/typedefs.dart';
import 'package:crypto_app/src/coins/domain/models/coin.dart';
import 'package:crypto_app/src/coins/domain/repositories/coins_repository.dart';
import 'package:equatable/equatable.dart';

class GetCoinById extends UseCaseWithParams<Coin, GetCoinByIdParams> {
  const GetCoinById(this._repo);
  final CoinsRepository _repo;

  @override
  ResultFuture<Coin> call(GetCoinByIdParams params) => _repo.getCoinById(params.id);
}

class GetCoinByIdParams extends Equatable {
  final String id;

  const GetCoinByIdParams({required this.id});

  @override
  List<Object?> get props => [id];
}