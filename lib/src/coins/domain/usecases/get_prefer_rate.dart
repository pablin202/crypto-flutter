import 'package:crypto_app/core/usecases/usecases.dart';
import 'package:crypto_app/core/utils/typedefs.dart';
import 'package:crypto_app/src/coins/domain/models/rates.dart';
import 'package:crypto_app/src/coins/domain/repositories/preferences_repository.dart';
import 'package:equatable/equatable.dart';

class GetPreferRate extends UseCaseWithoutParams<Rate> {
  const GetPreferRate(this._repo);

  final PreferenceRepository _repo;

  @override
  ResultFuture<Rate> call() {
    return _repo.getPreferRate();
  }
}
