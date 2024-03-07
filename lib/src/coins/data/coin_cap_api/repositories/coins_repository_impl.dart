import 'package:crypto_app/core/errors/exceptions.dart';
import 'package:crypto_app/core/errors/failures.dart';
import 'package:crypto_app/core/utils/typedefs.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/datasource/coin_cap_remote_datasource.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/mappers/coin_mapper.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/mappers/history_mapper.dart';
import 'package:crypto_app/src/coins/domain/models/coin.dart';
import 'package:crypto_app/src/coins/domain/models/history.dart';
import 'package:crypto_app/src/coins/domain/repositories/coins_repository.dart';
import 'package:dartz/dartz.dart';

class CoinsRepositoryImpl extends CoinsRepository {
  final CoinCapRemoteDataSource _remoteDataSource;

  CoinsRepositoryImpl(this._remoteDataSource);

  @override
  ResultFuture<List<Coin>> getCoins() async {
    try {
      final result = await _remoteDataSource.getAllCoins();
      final coins = result.data.map((coin) => coin.toCoin()!).toList();

      return Right(coins);
    } on ServerException catch (e) {
      return Left(ServerFailure(statusCode: e.statusCode, message: e.message));
    }
  }

  @override
  ResultFuture<Coin> getCoinById(String id) async {
    try {
      final result = await _remoteDataSource.getCoinById(id);
      final coin = result.data.toCoin()!;
      return Right(coin);
    } on ServerException catch (e) {
      return Left(ServerFailure(statusCode: e.statusCode, message: e.message));
    }
  }

  @override
  ResultFuture<List<History>> getHistoryById(
      String id, String interval, int start, int end) async {
    try {
      final result =
          await _remoteDataSource.getHistoryById(id, interval, start, end);
      final history =
          result.data.map((history) => history.toHistory()!).toList();
      return Right(history);
    } on ServerException catch (e) {
      return Left(ServerFailure(statusCode: e.statusCode, message: e.message));
    }
  }
}
