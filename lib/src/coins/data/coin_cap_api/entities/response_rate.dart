import 'dart:convert';
import 'package:crypto_app/core/utils/typedefs.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/entities/rate_entity.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/entities/response.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/entities/coin_entity.dart';

class ResponseRate extends Response<RateEntity> {
  const ResponseRate({required super.timestamp, required super.data});

  factory ResponseRate.fromJson(Map<String, dynamic> json) {
    return ResponseRate(
        timestamp: json['timestamp'] as dynamic,
        data: RateEntity.fromJson(json['data']));
  }

  ResponseRate copyWith({
    dynamic timestamp,
    RateEntity? data,
  }) {
    return ResponseRate(
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
