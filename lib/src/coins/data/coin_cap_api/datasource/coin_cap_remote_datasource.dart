import 'package:crypto_app/core/errors/exceptions.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/entities/response_coin.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/entities/response_coins.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/entities/response_history.dart';
import 'package:dio/dio.dart';

abstract class CoinCapRemoteDataSource {
  Future<ResponseCoins> getAllCoins();

  Future<ResponseCoin> getCoinById(String id);

  Future<ResponseHistory> getHistoryById(
      String id, String interval, int startDate, int endDate);
}

class CoinCapRemoteDataSourceImpl extends CoinCapRemoteDataSource {
  final Dio _dio;

  CoinCapRemoteDataSourceImpl(this._dio);

  @override
  Future<ResponseCoins> getAllCoins() async {
    try {
      final response = await _dio.get('/assets');

      if (response.statusCode != 200) {
        throw ServerException(
          message: response.data,
          statusCode: response.statusCode.toString(),
        );
      }

      return ResponseCoins.fromJson(response.data);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: '505');
    }
  }

  @override
  Future<ResponseCoin> getCoinById(String id) async {
    try {
      final response = await _dio.get('/assets/$id');

      if (response.statusCode != 200) {
        throw ServerException(
          message: response.data,
          statusCode: response.statusCode.toString(),
        );
      }

      return ResponseCoin.fromJson(response.data);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: '505');
    }
  }

  @override
  Future<ResponseHistory> getHistoryById(String id, String interval, int startDate, int endDate) async {
    try {
      final response = await _dio.get('/assets/$id/history?interval=$interval&start=$startDate&end=$endDate');

      if (response.statusCode != 200) {
        throw ServerException(
          message: response.data,
          statusCode: response.statusCode.toString(),
        );
      }

      return ResponseHistory.fromJson(response.data);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: '505');
    }
  }
}
