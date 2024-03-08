import 'package:crypto_app/core/usecases/usecases.dart';
import 'package:crypto_app/core/utils/typedefs.dart';
import 'package:crypto_app/src/coins/domain/models/coin.dart';
import 'package:crypto_app/src/coins/domain/models/rates.dart';
import 'package:crypto_app/src/coins/domain/repositories/coins_repository.dart';
import 'package:equatable/equatable.dart';

class GetRateById extends UseCaseWithParams<Rate, GetRateByIdParams> {
  const GetRateById(this._repo);
  final CoinsRepository _repo;

  @override
  ResultFuture<Rate> call(GetRateByIdParams params) => _repo.getRateById(params.id);
}

class GetRateByIdParams extends Equatable {
  final String id;

  const GetRateByIdParams({required this.id});

  @override
  List<Object?> get props => [id];
}