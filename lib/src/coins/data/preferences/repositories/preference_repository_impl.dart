import 'package:crypto_app/core/errors/exceptions.dart';
import 'package:crypto_app/core/errors/failures.dart';
import 'package:crypto_app/core/utils/typedefs.dart';
import 'package:crypto_app/src/coins/data/preferences/datasource/local_data_source.dart';
import 'package:crypto_app/src/coins/domain/models/rates.dart';
import 'package:crypto_app/src/coins/domain/repositories/preferences_repository.dart';
import 'package:dartz/dartz.dart';

class PreferenceRepositoryImpl extends PreferenceRepository {
  final LocalDataSource _localDataSource;

  PreferenceRepositoryImpl(this._localDataSource);

  @override
  ResultFuture<Rate> getPreferRate() async {
    try {
      final result = await _localDataSource.checkPreferRate();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(statusCode: e.statusCode, message: e.message));
    }
  }

  @override
  ResultVoid savePreferRate(Rate rate) async {
    try {
      final result = await _localDataSource.cachePreferRate(rate);
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(statusCode: e.statusCode, message: e.message));
    }
  }
}
