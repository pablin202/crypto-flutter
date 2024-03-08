import 'package:crypto_app/core/usecases/usecases.dart';
import 'package:crypto_app/core/utils/typedefs.dart';
import 'package:crypto_app/src/coins/domain/models/rates.dart';
import 'package:crypto_app/src/coins/domain/repositories/coins_repository.dart';

class GetAllRates extends UseCaseWithoutParams<List<Rate>> {
  const GetAllRates(this._repo);
  final CoinsRepository _repo;

  @override
  ResultFuture<List<Rate>> call() => _repo.getRates();
}
