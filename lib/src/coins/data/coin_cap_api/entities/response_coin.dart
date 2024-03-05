import 'dart:convert';
import 'package:crypto_app/core/utils/typedefs.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/entities/response.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/entities/coin_entity.dart';

class ResponseCoin extends Response<CoinEntity> {
  const ResponseCoin({required super.timestamp, required super.data});

  factory ResponseCoin.fromJson(Map<String, dynamic> json) {
    return ResponseCoin(
        timestamp: json['timestamp'] as dynamic,
        data: CoinEntity.fromJson(json['data']));
  }

  ResponseCoin copyWith({
    dynamic timestamp,
    CoinEntity? data,
  }) {
    return ResponseCoin(
      timestamp: timestamp,
      data: this.data,
    );
  }

  DataMap toMap() => {
    'timestamp': timestamp,
    'data': data,
  };

  String toJson() => jsonEncode(toMap());
}