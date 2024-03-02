import 'package:crypto_app/core/errors/exceptions.dart';
import 'package:crypto_app/core/errors/failures.dart';
import 'package:crypto_app/core/utils/typedefs.dart';
import 'package:crypto_app/src/coins/data/coin_paprika_api/datasources/coin_paprika_remo_datasource.dart';
import 'package:crypto_app/src/coins/data/coin_paprika_api/mappers/coin_mapper.dart';
import 'package:crypto_app/src/coins/domain/models/coin.dart';
import 'package:crypto_app/src/coins/domain/repositories/coins_repository.dart';
import 'package:dartz/dartz.dart';

class CoinsRepositoryImpl extends CoinsRepository {
  final CoinPaprikaRemoteDataSource _remoteDataSource;

  CoinsRepositoryImpl(this._remoteDataSource);

  @override
  ResultFuture<List<Coin>> getCoins() async {
    try {
      final result = await _remoteDataSource.getAllCoins();
      final leagues = result.map((coin) => coin.toCoin()!).toList();
      return Right(leagues);
    } on ServerException catch (e) {
      return Left(ServerFailure(statusCode: e.statusCode, message: e.message));
    }
  }
}
