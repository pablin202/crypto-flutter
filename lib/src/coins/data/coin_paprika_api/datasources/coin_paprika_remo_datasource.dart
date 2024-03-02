import 'package:crypto_app/core/errors/exceptions.dart';
import 'package:crypto_app/src/coins/data/coin_paprika_api/entities/coin_entity.dart';
import 'package:dio/dio.dart';

abstract class CoinPaprikaRemoteDataSource {
  Future<List<CoinEntity>> getAllCoins();
}

class CoinPaprikaRemoteDataSourceImpl extends CoinPaprikaRemoteDataSource {
  final Dio _dio;

  CoinPaprikaRemoteDataSourceImpl(this._dio);

  @override
  Future<List<CoinEntity>> getAllCoins() async {
    try {
      final response = await _dio.get('/v1/coins');

      if (response.statusCode != 200) {
        throw ServerException(
          message: response.data,
          statusCode: response.statusCode.toString(),
        );
      }

      return (response.data as List)
          .map((x) => CoinEntity.fromJson(x))
          .toList();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: '505');
    }
  }
}
