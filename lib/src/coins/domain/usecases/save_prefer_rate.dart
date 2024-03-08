import 'package:crypto_app/core/usecases/usecases.dart';
import 'package:crypto_app/core/utils/typedefs.dart';
import 'package:crypto_app/src/coins/domain/models/rates.dart';
import 'package:crypto_app/src/coins/domain/repositories/preferences_repository.dart';
import 'package:equatable/equatable.dart';

class SavePreferRate extends UseCaseWithParams<void, SavePreferParams> {
  const SavePreferRate(this._repo);

  final PreferenceRepository _repo;

  @override
  ResultFuture<void> call(SavePreferParams params) {
    return _repo.savePreferRate(params.rate);
  }
}

class SavePreferParams extends Equatable {
  final Rate rate;

  const SavePreferParams({required this.rate});

  @override
  List<Object?> get props => [rate];
}
