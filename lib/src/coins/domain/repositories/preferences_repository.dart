import 'package:crypto_app/core/utils/typedefs.dart';
import 'package:crypto_app/src/coins/domain/models/rates.dart';

abstract class PreferenceRepository {
  const PreferenceRepository();

  ResultFuture<Rate> getPreferRate();
  ResultFuture<void> savePreferRate(Rate rate);
}