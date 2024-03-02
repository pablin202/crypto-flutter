import 'dart:convert';
import 'package:crypto_app/core/utils/typedefs.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/entities/response.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/entities/coin_entity.dart';

class ResponseCoins extends Response<CoinEntity> {
  const ResponseCoins({required super.timestamp, required super.data});

  factory ResponseCoins.fromJson(Map<String, dynamic> json) {
    return ResponseCoins(
        timestamp: json['timestamp'] as dynamic,
        data: List<CoinEntity>.from(
            json['data'].map((x) => CoinEntity.fromJson(x))));
  }

  ResponseCoins copyWith({
    dynamic timestamp,
    List<CoinEntity>? data,
  }) {
    return ResponseCoins(
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
