import 'dart:convert';

import 'package:crypto_app/core/errors/exceptions.dart';
import 'package:crypto_app/src/coins/data/entities/coin_entity.dart';
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

      Iterable iterable = json.decode(response.data);

      return List<CoinEntity>.from(
          iterable.map((model) => CoinEntity.fromJson(model)));
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: '505');
    }
  }
}
