import 'package:crypto_app/core/usecases/usecases.dart';
import 'package:crypto_app/core/utils/typedefs.dart';
import 'package:crypto_app/src/coins/domain/models/coin.dart';
import 'package:crypto_app/src/coins/domain/repositories/coins_repository.dart';

class GetAllCoins extends UseCaseWithoutParams<List<Coin>> {
  const GetAllCoins(this._repo);
  final CoinsRepository _repo;

  @override
  ResultFuture<List<Coin>> call() => _repo.getCoins();
}
